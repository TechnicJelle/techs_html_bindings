import "package:techs_html_bindings/elements.dart";

extension StringID on String? {
  String id() {
    final String? id = this;
    if (id == null) return "";
    return ' id="$id"';
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
    if (args.containsKey("id")) {
      throw ArgumentError("May not contain `id`! Use the `id` parameter for this", "args");
    }
    if (args.containsKey("class")) {
      throw ArgumentError("May not contain `class`! Use the `classes` parameter for this", "args");
    }
    if (args.containsKey("style")) {
      throw ArgumentError("May not contain `style`! Use the `inlineStyles` parameter for this", "args");
    }

    final StringBuffer sb = StringBuffer();
    args.forEach((String key, String? value) {
      if (value != null) {
        sb.write(' $key="$value"');
      }
    });
    return sb.toString();
  }
}

extension BoolArg on bool {
  String arg(String argName) {
    if (this) return " $argName";
    return "";
  }
}

extension CloningHelpers on Element {
  List<Element> cloneChildren() => children.map((Element e) => e.clone()).toList();

  List<String>? cloneClasses() => classes?.toList();

  List<String>? cloneInlineStyles() => inlineStyles?.toList();

  Map<String, String?>? cloneArgs() => args == null ? null : Map.of(args!);
}
