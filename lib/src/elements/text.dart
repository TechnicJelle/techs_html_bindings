import "package:techs_html_bindings/elements.dart";

class T extends Element {
  String text;

  T(this.text) : super(children: []);

  T.single(Iterable<Element> elements) : text = elements.map((el) => el.build()).join(), super(children: []);

  T.multiline(Iterable<Element> lines)
    : text = lines.map((el) => el.build()).join("<br/>\n"),
      super(children: []);

  @override
  String build() {
    return text;
  }
}

class Br extends Element {
  Br() : super(children: const Iterable.empty());

  @override
  String build() {
    return "<br>";
  }
}

class P extends Element {
  P({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  P.text(
    String text, {
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [T(text)]);

  @override
  String build() {
    return "<p$modifiers>\n"
        "${children.map((el) => el.build()).join()}\n"
        "</p>\n";
  }
}

enum Target { self, blank, parent, top, unfencedTop }

class A extends Element {
  String href;
  Target? target;

  A({
    required this.href,
    required super.children,
    this.target,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  A.text(
    String text, {
    required this.href,
    this.target,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [T(text)]);

  A.newTab({
    required this.href,
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : target = .blank;

  A.newTabText(
    String text, {
    required this.href,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : target = .blank,
       super(children: [T(text)]);

  @override
  String build() {
    String modifiers = this.modifiers;
    if (target != null) modifiers += ' target="_${target!.name}"';
    return '<a href="$href"$modifiers>'
        "${children.map((el) => el.build()).join()}"
        "</a>";
  }
}

class Span extends Element {
  Span({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  Span.text(
    String text, {
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [T(text)]);

  @override
  String build() {
    return "<span$modifiers>"
        '${children.map((el) => el.build()).join(" ")}'
        "</span>";
  }
}

class Summary extends Element {
  Summary({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  Summary.text(
    String text, {
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [T(text)]);

  @override
  String build() {
    return "<summary$modifiers>"
        '${children.map((el) => el.build()).join("\n")}'
        "</summary>";
  }
}

class Details extends Element {
  Summary summary;

  Details({
    required this.summary,
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<details$modifiers>\n"
        "${summary.build()}\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</details>";
  }
}

class Em extends Element {
  Em({required super.children});

  Em.text(String text) : super(children: [T(text)]);

  @override
  String build() {
    return "<em>"
        "${children.map((el) => el.build()).join()}"
        "</em>";
  }
}

class Strong extends Element {
  Strong({required super.children});

  Strong.text(String text) : super(children: [T(text)]);

  @override
  String build() {
    return "<strong>"
        "${children.map((el) => el.build()).join()}"
        "</strong>";
  }
}
