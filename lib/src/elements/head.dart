import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

part "copyWith/head.dart";

class Head extends Element {
  String title;

  Iterable<Meta>? metas;
  Iterable<Link>? links;
  Iterable<Style>? styles;

  Head({
    required this.title,
    this.metas,
    this.links,
    this.styles,
  }) : super(children: [...?metas, ...?links, ...?styles]);

  @override
  String build() {
    final Iterable<Iterable<Element>> categories = [?metas, ?links, ?styles];
    final String concatenated = categories
        .map((Iterable<Element> els) => els.map((Element el) => el.build()).join("\n"))
        .join("\n\n");
    return "<head>\n"
        '<meta charset="UTF-8" />\n'
        '<meta name="viewport" content="width=device-width, initial-scale=1" />\n'
        "<title>$title</title>\n\n"
        "$concatenated\n"
        "</head>";
  }

  @override
  Head clone() => Head(
    title: title,
    metas: metas?.map((Meta m) => m.clone()).toList(),
    links: links?.map((Link l) => l.clone()).toList(),
    styles: styles?.map((Style s) => s.clone()).toList(),
  );
}

class Meta extends Element {
  String key;
  String value;

  String? content;

  Meta._(
    this.key,
    this.value,
    this.content,
  ) : super(children: []);

  Meta.name(
    String name, {
    required this.content,
  }) : key = "name",
       value = name,
       super(children: []);

  Meta.property(
    String property, {
    required this.content,
  }) : key = "property",
       value = property,
       super(children: []);

  Meta.httpEquiv(
    String httpEquiv, {
    required this.content,
  }) : key = "http-equiv",
       value = httpEquiv,
       super(children: []);

  @override
  String build() {
    if (content != null) {
      return '<meta $key="$value" content="$content" />';
    }
    return '<meta $key="$value" />';
  }

  @override
  Meta clone() => Meta._(
    key,
    value,
    content,
  );
}

enum PreloadType {
  fetch,
  font,
  image,
  script,
  style,
  track,
}

class Link extends Element {
  String rel;
  String href;

  Link._(
    this.rel,
    this.href, {
    required super.args,
  }) : super(children: []);

  Link.icon({
    required String? type,
    required String? sizes,
    required this.href,
  }) : rel = "icon",
       super(
         args: {
           "type": type,
           "sizes": sizes,
         },
         children: [],
       );

  Link.stylesheet({
    required this.href,
  }) : rel = "stylesheet",
       super(children: []);

  Link.preload({
    required this.href,
    required PreloadType as,
  }) : rel = "preload",
       super(
         args: {
           "as": as.name,
         },
         children: [],
       );

  static List<Link> preloadedStylesheet({required String href}) {
    return [
      Link.preload(href: href, as: PreloadType.style),
      Link.stylesheet(href: href),
    ];
  }

  Link.atom({
    required this.href,
    required String title,
  }) : rel = "alternate",
       super(
         args: {
           "type": "application/atom+xml",
           "title": title,
         },
         children: [],
       );

  @override
  String build() {
    return '<link rel="$rel" href="$href"${args.args()} />';
  }

  @override
  Link clone() => Link._(
    rel,
    href,
    args: cloneArgs(),
  );
}

class Style extends Element {
  String css;

  Style({
    required this.css,
  }) : super(children: []);

  @override
  String build() {
    return "<style>\n"
        "${css.trim()}\n"
        "</style>";
  }

  @override
  Style clone() => Style(
    css: css,
  );
}
