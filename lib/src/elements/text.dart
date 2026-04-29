import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

class T extends Element {
  String text;

  T(this.text) : super(children: []);

  T.single(Iterable<Element> elements, {BuildOptions? buildOptions})
    : text = elements.map((el) => el.build(buildOptions: buildOptions)).join(),
      super(children: []);

  T.multiline(Iterable<Element> lines, {BuildOptions? buildOptions})
    : text = lines.map((el) => el.build(buildOptions: buildOptions)).join("<br />\n"),
      super(children: []);

  @override
  String build({BuildOptions? buildOptions}) {
    return text;
  }
}

class Br extends Element {
  Br() : super(children: const Iterable.empty());

  @override
  String build({BuildOptions? buildOptions}) {
    return "<br />";
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
  String build({BuildOptions? buildOptions}) {
    return "<p$modifiers>\n"
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}\n"
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
  String build({BuildOptions? buildOptions}) {
    String modifiers = this.modifiers;
    if (target != null) modifiers += ' target="_${target!.name}"';
    return '<a href="$href"$modifiers>'
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}"
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
  String build({BuildOptions? buildOptions}) {
    return "<span$modifiers>"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join(" ")}'
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
  String build({BuildOptions? buildOptions}) {
    return "<summary$modifiers>"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}'
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
  String build({BuildOptions? buildOptions}) {
    return "<details$modifiers>\n"
        "${summary.build(buildOptions: buildOptions)}\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
        "</details>";
  }
}

class Em extends Element {
  Em({required super.children});

  Em.text(String text) : super(children: [T(text)]);

  @override
  String build({BuildOptions? buildOptions}) {
    return "<em>"
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}"
        "</em>";
  }
}

class Strong extends Element {
  Strong({required super.children});

  Strong.text(String text) : super(children: [T(text)]);

  @override
  String build({BuildOptions? buildOptions}) {
    return "<strong>"
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}"
        "</strong>";
  }
}
