// dart format width=94
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

abstract class Hn extends Element {
  int level;

  Hn({
    required this.level,
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  }) {
    if (id == null && ConstructOptions.hAutoIDEnabled) {
      id = ConstructOptions.hAutoIDGenerator(this);
    }
  }

  /// Create a Heading with the provided [level].
  factory Hn.fromLevel({
    required int level,
    required Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  }) => switch (level) {
    1 => H1(children: children, id: id, classes: classes, inlineStyles: inlineStyles),
    2 => H2(children: children, id: id, classes: classes, inlineStyles: inlineStyles),
    3 => H3(children: children, id: id, classes: classes, inlineStyles: inlineStyles),
    4 => H4(children: children, id: id, classes: classes, inlineStyles: inlineStyles),
    5 => H5(children: children, id: id, classes: classes, inlineStyles: inlineStyles),
    6 => H6(children: children, id: id, classes: classes, inlineStyles: inlineStyles),
    _ => throw Exception("Level $level was outside of the accepted range (1 to 6)"),
  };

  @override
  String build({BuildOptions? buildOptions}) {
    buildOptions ??= BuildOptions.def;
    final List<Element> children = this.children.toList();

    if (buildOptions.hAutoLinkEnabled && id != null) {
      final Element? link = buildOptions.hAutoLinkGenerator(this);
      if (link != null) children.add(link);
    }

    return "<h$level$modifiers>"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}'
        "</h$level>";
  }
}

class H1 extends Hn {
  H1({required super.children, super.id, super.classes, super.inlineStyles})
    : super(level: 1);

  H1.text(String text, {super.id, super.classes, super.inlineStyles})
    : super(level: 1, children: [T(text)]);
}

class H2 extends Hn {
  H2({required super.children, super.id, super.classes, super.inlineStyles})
    : super(level: 2);

  H2.text(String text, {super.id, super.classes, super.inlineStyles})
    : super(level: 2, children: [T(text)]);
}

class H3 extends Hn {
  H3({required super.children, super.id, super.classes, super.inlineStyles})
    : super(level: 3);

  H3.text(String text, {super.id, super.classes, super.inlineStyles})
    : super(level: 3, children: [T(text)]);
}

class H4 extends Hn {
  H4({required super.children, super.id, super.classes, super.inlineStyles})
    : super(level: 4);

  H4.text(String text, {super.id, super.classes, super.inlineStyles})
    : super(level: 4, children: [T(text)]);
}

class H5 extends Hn {
  H5({required super.children, super.id, super.classes, super.inlineStyles})
    : super(level: 5);

  H5.text(String text, {super.id, super.classes, super.inlineStyles})
    : super(level: 5, children: [T(text)]);
}

class H6 extends Hn {
  H6({required super.children, super.id, super.classes, super.inlineStyles})
    : super(level: 6);

  H6.text(String text, {super.id, super.classes, super.inlineStyles})
    : super(level: 6, children: [T(text)]);
}
