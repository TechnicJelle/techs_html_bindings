import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

class Body extends Element {
  Header header;
  Main main;
  Footer footer;

  Body({
    required this.header,
    required this.main,
    required this.footer,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [header, main, footer]);

  @override
  String build({BuildOptions? buildOptions}) {
    return "<body$modifiers>\n"
        "${header.build(buildOptions: buildOptions)}\n\n"
        "${main.build(buildOptions: buildOptions)}\n\n"
        "${footer.build(buildOptions: buildOptions)}\n"
        "</body>";
  }
}

class Header extends Element {
  Header({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<header$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n\n")}\n'
        "</header>";
  }
}

class Main extends Element {
  Main({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<main$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n\n")}\n'
        "</main>";
  }
}

class Footer extends Element {
  Footer({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build({BuildOptions? buildOptions}) {
    return "<footer$modifiers>\n"
        '${children.map((el) => el.build(buildOptions: buildOptions)).join("\n\n")}\n'
        "</footer>";
  }
}
