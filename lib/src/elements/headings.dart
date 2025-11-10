import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

abstract class Hn extends Element {
  ///Override this if you want the automatic links to have a different class.
  static String autoLinkClass = "link";

  ///Override this if you want to display something else than a 🔗 as the link.
  static Element autoLinkElement = T("🔗");

  int level;
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
  /// `H1`, `H5`, `H6` *do not* get auto-linked. `H2`, `H3`, `H4` *do* get auto-linked.
  static Hn fromLevel({
    required int level,
    required Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID = true,
    bool? autoLink,
  }) => switch (level) {
    1 => H1(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? false),
    2 => H2(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? true),
    3 => H3(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? true),
    4 => H4(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? true),
    5 => H5(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? false),
    6 => H6(children: children, id: id, classes: classes, inlineStyles: inlineStyles, autoID: autoID, autoLink: autoLink ?? false),
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
  H1({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = false})
    : super(level: 1);
}

class H2 extends Hn {
  H2({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink})
    : super(level: 2);
}

class H3 extends Hn {
  H3({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink})
    : super(level: 3);
}

class H4 extends Hn {
  H4({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink})
    : super(level: 4);
}

class H5 extends Hn {
  H5({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = false})
    : super(level: 5);
}

class H6 extends Hn {
  H6({required super.children, super.id, super.classes, super.inlineStyles, super.autoID, super.autoLink = false})
    : super(level: 6);
}
