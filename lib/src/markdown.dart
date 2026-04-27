import "package:html/dom.dart" as html2;
import "package:html/parser.dart" as html2;
import "package:markdown/markdown.dart" as md;
import "package:techs_html_bindings/elements.dart" as html;

/// Parse markdown
List<html.Element> markdown(String markdown) {
  final md.Document document = md.Document(encodeHtml: false, extensionSet: md.ExtensionSet.gitHubFlavored);
  final List<md.Node> nodes = document.parse(markdown);
  final List<html.Element> elements = nodes.map(mdNodeToHtmlElement).toList();
  return elements;
}

html.Element mdNodeToHtmlElement(md.Node node) => switch (node) {
  md.Element() => mdElementToHtmlElement(node),
  md.Text(:final text) when text.startsWith(RegExp(r"\s*<\w+.*>")) => inlineHtmlToHtmlElement(text),
  md.Text(:final text) when text.startsWith(RegExp(r"\s*<!---")) => html.T(""),
  md.Text() => html.T(node.text),
  _ => throw UnsupportedError("Node type '$node' not supported!"),
};

html.Element inlineHtmlToHtmlElement(String text) {
  final fragment = html2.parseFragment(text);
  final element = fragment.nodes.first as html2.Element;

  final String tag = element.localName!;
  final Map<String, String> attr = element.attributes.map((key, value) => MapEntry(key as String, value));

  return switch (tag) {
    "video" => html.Video(
      src: attr["src"]!,
      width: attr.i("width"),
      height: attr.i("height"),
      autoplay: attr.b("autoplay"),
      controls: attr.b("controls"),
      disablePictureInPicture: attr.b("disablepictureinpicture"),
      disableRemotePlayback: attr.b("disableremoteplayback"),
      loop: attr.b("loop"),
      muted: attr.b("muted"),
      playsInline: attr.b("playsinline"),
    ),
    _ => throw UnsupportedError("Inline element tag '$tag' not supported!"),
  };
}

extension _AttrGetters on Map<String, String> {
  bool b(String key) => this[key] != null;

  int? i(String key) => this[key] != null ? int.parse(this[key]!) : null;
}

html.Element mdElementToHtmlElement(md.Element element) {
  final String tag = element.tag;
  final List<html.Element> children = element.children?.map(mdNodeToHtmlElement).toList() ?? [];
  final Map<String, String> attr = element.attributes;
  final List<String>? align = attr["align"] != null ? ["text-align: ${attr["align"]}"] : null;
  return switch (tag) {
    "h1" => html.H1(children: children),
    "h2" => html.H2(children: children),
    "h3" => html.H3(children: children),
    "h4" => html.H4(children: children),
    "h5" => html.H5(children: children),
    "h6" => html.H6(children: children),
    "p" => html.P(children: children),
    "pre" => html.Pre(children: children),
    "code" => html.Code(children: children, classes: attr["class"]?.split(" ")),
    "br" => html.Br(),
    "hr" => html.Hr(),
    "a" => html.A(href: attr["href"]!, children: children),
    "em" => html.Em(children: children),
    "strong" => html.Strong(children: children),
    "img" => html.Image(src: attr["src"]!, alt: attr["alt"]!),
    "blockquote" => html.BlockQuote(children: children, cite: attr["cite"]),
    "ul" => html.UnorderedList(items: children.map((e) => e as html.ListItem)),
    "ol" => html.OrderedList(items: children.map((e) => e as html.ListItem)),
    "li" => html.ListItem(children: children),
    "th" => html.TableHeader(children: children, inlineStyles: align),
    "tr" => html.TableRow(cells: children.map((e) => e as html.TableCell)),
    "thead" => html.TableHead(rows: children.map((e) => e as html.TableRow)),
    "td" => html.TableData(children: children, inlineStyles: align),
    "tbody" => html.TableBody(rows: children.map((e) => e as html.TableRow)),
    "table" => html.Table(
      head: children.whereType<html.TableHead>().firstOrNull ?? html.TableHead(rows: []),
      body: children.whereType<html.TableBody>().firstOrNull ?? html.TableBody(rows: []),
    ),
    _ => throw UnsupportedError("Element tag '$tag' not supported!"),
  };
}
