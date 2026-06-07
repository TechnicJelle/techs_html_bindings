import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

part "copyWith/base.dart";

abstract class Element {
  Iterable<Element> children;
  String? id;
  Iterable<String>? classes;
  Iterable<String>? inlineStyles;
  Map<String, String?>? args;

  Element({
    required this.children,
    this.id,
    this.classes,
    this.inlineStyles,
    this.args,
  });

  String get modifiers => "${id.id()}${classes.classes()}${inlineStyles.styles()}${args.args()}";

  String build();

  /// Makes a deep copy of the element
  Element clone();

  void collectChildrenOfType<E>({required List<E> into}) {
    children.collectOfType(into: into);
  }

  String get innerText => _innerText.trimRight();

  String get _innerText {
    if (this case T(:final text)) return text.replaceAll("\n", " ");

    final StringBuffer sb = StringBuffer();
    for (final child in children) {
      sb.write(child._innerText);
    }
    sb.write(" ");
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
    return "<!DOCTYPE html>\n"
        '<html lang="$lang">\n'
        "${head.build()}\n\n"
        "${body.build()}\n"
        "</html>";
  }

  @override
  HTML clone() => HTML(
    lang: lang,
    head: head.clone(),
    body: body.clone(),
  );
}
