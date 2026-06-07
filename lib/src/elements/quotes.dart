import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/internal_utils.dart";

part "copyWith/quotes.dart";

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

  @override
  BlockQuote clone() => BlockQuote(
    children: cloneChildren(),
    cite: cite,
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
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

  @override
  Q clone() => Q(
    children: cloneChildren(),
    cite: cite,
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}
