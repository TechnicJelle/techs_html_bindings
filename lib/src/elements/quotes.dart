import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

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
  String build({BuildOptions? buildOptions}) {
    String modifiers = this.modifiers;
    if (cite != null) modifiers += ' cite="$cite"';

    return "<blockquote$modifiers>"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}'
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
  String build({BuildOptions? buildOptions}) {
    String modifiers = this.modifiers;
    if (cite != null) modifiers += ' cite="$cite"';

    return "<q$modifiers>"
        "${children.map((el) => el.build(buildOptions: buildOptions)).join()}"
        "</q>";
  }
}
