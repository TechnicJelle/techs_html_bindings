import "dart:convert";

import "package:techs_html_bindings/elements.dart";

const HtmlEscape _htmlEscape = HtmlEscape();

extension StringCleaning on String {
  String escape() {
    return _htmlEscape.convert(this);
  }

  String clean() {
    return toLowerCase().replaceAll(RegExp("[^a-z0-9 ]"), "").trim().replaceAll(" ", "-");
  }
}

extension StringID on String? {
  String id() {
    final String? id = this;
    if (id == null) return "";
    return ' id="$id"';
  }
}

extension BoolArg on bool {
  String arg(String argName) {
    if (this) return " $argName";
    return "";
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
  void replace({required List<Element>? Function(Element) test}) {
    for (int i = length - 1; i >= 0; i--) {
      final element = this[i];
      final List<Element>? toReplace = test(element);
      if (toReplace != null) {
        removeAt(i);
        insertAll(i, toReplace);
      }
      (element.children as List<Element>).replace(test: test);
    }
  }
}

extension IterablesToInsertables on Iterable<String>? {
  String classes() {
    final Iterable<String>? classes = this;
    if (classes == null) return "";
    return ' class="${classes.join(" ")}"';
  }

  String styles() {
    final Iterable<String>? styles = this;
    if (styles == null) return "";
    return ' style="${styles.join("; ")};"';
  }
}

extension MapToInsertables on Map<String, String?>? {
  String args() {
    final Map<String, String?>? args = this;
    if (args == null) return "";
    final StringBuffer sb = StringBuffer();
    args.forEach((String key, String? value) {
      if (value != null) {
        sb.write(" $key=$value");
      }
    });
    return sb.toString();
  }
}
