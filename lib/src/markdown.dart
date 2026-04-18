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
  md.Text() => html.T(node.text),
  _ => throw UnsupportedError("Node type '$node' not supported!"),
};

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
