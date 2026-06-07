import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

part "copyWith/body.dart";

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
  String build() {
    return "<body$modifiers>\n"
        "${header.build()}\n\n"
        "${main.build()}\n\n"
        "${footer.build()}\n"
        "</body>";
  }

  @override
  Body clone() => Body(
    header: header.clone(),
    main: main.clone(),
    footer: footer.clone(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

class Header extends Element {
  Header({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<header$modifiers>\n"
        '${children.map((el) => el.build()).join("\n\n")}\n'
        "</header>";
  }

  @override
  Header clone() => Header(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

class Main extends Element {
  Main({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<main$modifiers>\n"
        '${children.map((el) => el.build()).join("\n\n")}\n'
        "</main>";
  }

  @override
  Main clone() => Main(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}

class Footer extends Element {
  Footer({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<footer$modifiers>\n"
        '${children.map((el) => el.build()).join("\n\n")}\n'
        "</footer>";
  }

  @override
  Footer clone() => Footer(
    children: cloneChildren(),
    id: id,
    classes: cloneClasses(),
    inlineStyles: cloneInlineStyles(),
  );
}
