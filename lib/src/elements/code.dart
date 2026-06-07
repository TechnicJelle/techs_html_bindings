import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

part "copyWith/code.dart";

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

  @override
  Pre clone() => Pre(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
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

  @override
  Code clone() => Code(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}
