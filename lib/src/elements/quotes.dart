import "package:techs_html_bindings/elements.dart";

class BlockQuote extends Element {
  String? cite;

  BlockQuote({
    required super.children,
    this.cite,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    String modifiers = this.modifiers;
    if (cite != null) modifiers += ' cite="$cite"';

    return "<blockquote$modifiers>"
        '${children.map((el) => el.build()).join("\n")}'
        "</blockquote>";
  }
}

class Q extends Element {
  String? cite;

  Q({
    required super.children,
    this.cite,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    String modifiers = this.modifiers;
    if (cite != null) modifiers += ' cite="$cite"';

    return "<q$modifiers>"
        "${children.map((el) => el.build()).join()}"
        "</q>";
  }
}
