import "package:techs_html_bindings/elements.dart";
import "package:test/test.dart";

void main() {
  group("Primary tests", () {
    setUp(() {
      // Additional setup goes here.
    });

    test("1", () {
      final html = HTML(
        lang: "en",
        head: Head(title: "Test"),
        body: Body(
          header: Header(children: []),
          main: Main(children: []),
          footer: Footer(children: []),
        ),
      );
      final String text = html.build();
      expect(text, isNotEmpty);
    });
  });
}
