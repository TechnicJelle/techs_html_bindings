import "package:html/dom.dart" as big;
import "package:html/parser.dart" as big;
import "package:markdown/markdown.dart";
import "package:techs_html_bindings/elements.dart" as html;

/// Parse markdown
List<html.Element> markdown(String markdown) {
  final String markdownHtml = markdownToHtml(markdown, encodeHtml: false, extensionSet: .gitHubFlavored);
  final nodes = big.parseFragment(markdownHtml).nodes;
  final List<html.Element> elements = nodes.map(bigHtmlToMyHtml).where((e) => e is! Nothing).toList();
  return elements;
}

html.Element bigHtmlToMyHtml(big.Node node) => switch (node) {
  big.Element() => bigHtmlElementToMyElement(node),
  big.Text(:final text) when text.trim().isEmpty => Nothing(),
  big.Text(:final text) => html.T(text),
  big.Comment(:final data) when (data?.isNotEmpty ?? false) && data?[0] == "-" => Nothing(),
  big.Comment(:final data) => html.T("<!--${data ?? ""}-->"),
  _ => throw UnsupportedError("Node type '$node' not supported!"),
};

html.Element bigHtmlElementToMyElement(big.Element element) {
  final String tag = element.localName!;
  final List<html.Element> children = element.nodes.map(bigHtmlToMyHtml).toList();
  final Map<String, String> attr = element.attributes.map((key, value) => MapEntry(key as String, value));
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
    "img" => html.Image(
      src: attr["src"]!,
      alt: attr["alt"]!,
      width: attr.i("width"),
      height: attr.i("height"),
    ),
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
    "summary" => html.Summary(children: children),
    "details" => html.Details(
      summary: children.whereType<html.Summary>().firstOrNull ?? html.Summary(children: []),
      children: children.where((e) => e is! html.Summary),
    ),
    _ => throw UnsupportedError("Element tag '$tag' not supported!"),
  };
}

class Nothing extends html.Element {
  Nothing() : super(children: []);

  @override
  String build() => "";
}

extension _AttrGetters on Map<String, String> {
  bool b(String key) => this[key] != null;

  int? i(String key) => this[key] != null ? int.parse(this[key]!) : null;
}
