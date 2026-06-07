import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/internal_utils.dart";

part "copyWith/layout.dart";

class Div extends Element {
  Div({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
    super.args,
  });

  @override
  String build() {
    return "<div$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</div>";
  }

  @override
  Div clone() => Div(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
    args: cloneArgs(),
  );
}

class Section extends Element {
  Section({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<section$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</section>";
  }

  @override
  Section clone() => Section(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

class Nav extends Element {
  Nav({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<nav$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</nav>";
  }

  @override
  Nav clone() => Nav(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

class Aside extends Element {
  Aside({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<aside$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</aside>";
  }

  @override
  Aside clone() => Aside(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}
