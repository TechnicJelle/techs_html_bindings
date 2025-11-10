import "dart:io";

import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/markdown.dart";
import "package:test/test.dart";

void main() {
  group("Markdown tests", () {
    setUp(() {
      // Additional setup goes here.
    });

    test("1", () {
      final List<Element> elements = markdown(File("README.md").readAsStringSync());
      expect(elements, isNotEmpty);
    });
  });
}
