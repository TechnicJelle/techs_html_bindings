import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

abstract class Element {
  Iterable<Element> children;
  String? id;
  Iterable<String>? classes;
  Iterable<String>? inlineStyles;

  Element({
    required this.children,
    this.id,
    this.classes,
    this.inlineStyles,
  });

  String get modifiers => "${id.id()}${classes.classes()}${inlineStyles.styles()}";

  String build();

  void collectChildrenOfType<E>({required List<E> into}) {
    children.collectOfType(into: into);
  }

  String get innerText {
    final List<T> texts = [];
    collectChildrenOfType(into: texts);
    final sb = StringBuffer();
    for (final T text in texts) {
      sb.write(text.text);
    }
    return sb.toString();
  }

  @override
  String toString() {
    return "<$runtimeType #$modifiers> $innerText";
  }
}

class HTML extends Element {
  String lang;
  Head head;
  Body body;

  HTML({
    required this.lang,
    required this.head,
    required this.body,
  }) : super(children: [body]);

  @override
  String build() {
    return '<html lang="$lang">\n'
        "${head.build()}\n\n"
        "${body.build()}\n"
        "</html>";
  }
}
