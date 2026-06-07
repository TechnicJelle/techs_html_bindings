import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";
import "package:test/test.dart";

void main() {
  group("Deep Copy tests", () {
    setUp(() {
      // Additional setup goes here.
    });

    test("Big one", () {
      final htmlModded = HTML(
        lang: "en",
        head: Head(
          title: "Big Deep Copy Test",
          metas: [
            Meta.httpEquiv("X-Clacks-Overhead", content: "GNU Terry Pratchett"),
          ],
        ),
        body: Body(
          header: Header(
            children: [
              Nav(
                children: [
                  UnorderedList(
                    items: [
                      ListItem(
                        children: [
                          A.text("One", href: "#"),
                          A.text("Two", href: "#"),
                          A.text("Three", href: "#"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          main: Main(
            children: [
              H1.text("Big Deep Copy Test"),
              P.text("Lorem ipsum and whatnot."),
            ],
          ),
          footer: Footer(
            children: [
              Time.now(),
            ],
          ),
        ),
      );
      final htmlOrig = htmlModded.clone();

      // Test meta head
      htmlModded.head.metas!.first.content = "We love him";
      expect(htmlModded.head.metas!.first.content, isNot(htmlOrig.head.metas!.first.content));

      // While this copies the list, it shares all the references to the child objects, which are the ones that actually contain the data,
      //  so if the children are replaced as below, they are also replaced in the actual htmlModded's children. (This is why deep copying was added in the first place!)
      htmlModded.children.toList()
        // Test header nav a href replacement
        ..replace(
          test: (element) {
            if (element is! A) return null;
            return [element.copyWith(href: "#2")];
          },
        )
        // Test body h1 replacement
        ..replace(
          test: (element) {
            if (element is! H1) return null;
            return [H2.text(element.innerText)];
          },
        );

      // Test header nav a href replacement
      final List<A> html1as = [];
      htmlModded.collectChildrenOfType<A>(into: html1as);
      expect(
        html1as.reduce((a, b) => A.text(a.innerText + b.innerText, href: a.href + b.href)).href,
        "#2#2#2",
      );

      final List<A> html2as = [];
      htmlOrig.collectChildrenOfType<A>(into: html2as);
      expect(
        html2as.reduce((a, b) => A.text(a.innerText + b.innerText, href: a.href + b.href)).href,
        "###",
      );

      // Test body h1 replacement
      final List<H1> html1h1s = [];
      htmlModded.collectChildrenOfType<H1>(into: html1h1s);
      expect(html1h1s, isEmpty);

      final List<H1> html2h1s = [];
      htmlOrig.collectChildrenOfType<H1>(into: html2h1s);
      expect(html2h1s, isNotEmpty);
    });
  });
}
