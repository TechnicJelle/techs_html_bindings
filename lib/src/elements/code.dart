import "package:techs_html_bindings/techs_html_bindings.dart";

class Pre extends Element {
  Pre({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<pre$modifiers>"
        '${children.map((el) => el.build()).join("\n")}'
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
  String build() {
    return "<code$modifiers>"
        '${children.map((el) => el.build()).join("\n")}'
        "</code>";
  }
}
