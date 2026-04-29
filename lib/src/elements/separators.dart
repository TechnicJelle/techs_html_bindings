import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";

class Hr extends Element {
  Hr() : super(children: const Iterable.empty());

  @override
  String build({BuildOptions? buildOptions}) {
    return "<hr />";
  }
}
