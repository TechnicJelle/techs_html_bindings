// dart format width=144
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

abstract class Hn extends Element {
  ///Override this if you want the automatic links to have a different class.
  static String autoLinkClass = "link";

  ///Override this if you want to display something else than a 🔗 as the link.
  static Element autoLinkElement = T("🔗");

  final int level;
  bool autoLink;

  Hn({
    required this.level,
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
    bool autoID = true,
    this.autoLink = true,
  }) {
    if (id == null && autoID) {
      id = innerText.clean();
    }
  }

  /// Create a Heading with the provided [level].
  ///
  /// If [autoLink] is null (or not provided), it will use the default options for each specific heading level:\
  /// [H1], [H5], [H6] *do not* get auto-linked. [H2], [H3], [H4] *do* get auto-linked.
  factory Hn.fromLevel({
    required int level,
    required Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID = true,
    bool? autoLink,
  }) => switch (level) {
    1 => H1(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? H1.defaultAutoLink),
    2 => H2(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? H2.defaultAutoLink),
    3 => H3(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? H3.defaultAutoLink),
    4 => H4(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? H4.defaultAutoLink),
    5 => H5(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? H5.defaultAutoLink),
    6 => H6(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? H6.defaultAutoLink),
    _ => throw Exception("Level $level was outside of the accepted range (1 to 6)"),
  };

  @override
  String build() {
    final Iterable<Element> thisChildren = [
      ...children,
      if (autoLink && id != null)
        A(
          classes: [autoLinkClass],
          href: "#${id!}",
          children: [autoLinkElement],
        ),
    ];
    return "<h$level$modifiers>"
        '${thisChildren.map((el) => el.build()).join("\n")}'
        "</h$level>";
  }
}

class H1 extends Hn {
  static const bool defaultAutoLink = false;

  H1({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink}) //
    : super(level: 1);

  H1.text(String text, {super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink})
    : super(level: 1, children: [T(text)]);
}

class H2 extends Hn {
  static const bool defaultAutoLink = true;

  H2({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink}) //
    : super(level: 2);

  H2.text(String text, {super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink})
    : super(level: 2, children: [T(text)]);
}

class H3 extends Hn {
  static const bool defaultAutoLink = true;

  H3({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink}) //
    : super(level: 3);

  H3.text(String text, {super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink})
    : super(level: 3, children: [T(text)]);
}

class H4 extends Hn {
  static const bool defaultAutoLink = true;

  H4({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink}) //
    : super(level: 4);

  H4.text(String text, {super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink})
    : super(level: 4, children: [T(text)]);
}

class H5 extends Hn {
  static const bool defaultAutoLink = false;

  H5({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink}) //
    : super(level: 5);

  H5.text(String text, {super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink})
    : super(level: 5, children: [T(text)]);
}

class H6 extends Hn {
  static const bool defaultAutoLink = false;

  H6({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink}) //
    : super(level: 6);

  H6.text(String text, {super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = defaultAutoLink})
    : super(level: 6, children: [T(text)]);
}
