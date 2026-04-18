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

    test("Table", () {
      const String strMarkdown = """
# Table Test

| Column 1 | Column 2 |
| -------- | -------: |
| Row 1a   | Row 1b   |
| Row 2a   | Row 2b   |
| a        | b        |

This concludes the Table Test.
""";
      final List<Element> elements = markdown(strMarkdown);
      expect(elements, isNotEmpty);
      expect(elements.whereType<Table>().firstOrNull, isNotNull);
    });
  });
}
