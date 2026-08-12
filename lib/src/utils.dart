import "dart:convert";

import "package:techs_html_bindings/elements.dart";

const HtmlEscape _htmlEscape = HtmlEscape();

extension StringCleaning on String {
  String escape() {
    return _htmlEscape.convert(this);
  }

  String clean() {
    return toLowerCase().replaceAll(RegExp(r"[^a-z0-9]"), " ").trim().replaceAll(RegExp(r"\s+"), "-");
  }
}

extension ElementCollector on Iterable<Element> {
  void collectOfType<E>({required List<E> into}) {
    for (final element in this) {
      if (element case final E e) {
        into.add(e);
      }
      element.children.collectOfType(into: into);
    }
  }
}

extension ElementReplacer on List<Element> {
  /// [test] gives you an element to interrogate.
  /// You must return a list of elements if you want to replace that element with that list.
  /// Return null to not replace that element.
  void replace({required List<Element>? Function(Element element) test}) {
    for (int i = length - 1; i >= 0; i--) {
      final element = this[i];
      final List<Element>? toReplace = test(element);
      if (toReplace != null) {
        removeAt(i);
        insertAll(i, toReplace);
      }
      if (element.children.isNotEmpty) (element.children as List<Element>).replace(test: test);
    }
  }
}
