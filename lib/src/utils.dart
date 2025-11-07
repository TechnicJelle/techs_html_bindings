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
