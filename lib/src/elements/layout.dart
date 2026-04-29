import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

class Div extends Element {
  Div({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
    super.args,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<div$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
        "</div>";
  }
}

class Section extends Element {
  Section({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<section$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
        "</section>";
  }
}

class Nav extends Element {
  Nav({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<nav$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
        "</nav>";
  }
}

class Aside extends Element {
  Aside({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<aside$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n")}\n'
        "</aside>";
  }
}
