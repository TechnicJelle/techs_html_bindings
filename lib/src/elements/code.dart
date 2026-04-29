import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

class Pre extends Element {
  Pre({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<pre$modifiers>"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}'
        "</pre>";
  }
}

class Code extends Element {
  Code({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<code$modifiers>"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}'
        "</code>";
  }
}
