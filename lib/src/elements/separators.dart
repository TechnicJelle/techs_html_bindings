import "package:techs_html_bindings/elements.dart";

class Hr extends Element {
  Hr() : super(children: const Iterable.empty());

  @override
  String build() {
    return "<hr />";
  }
}
