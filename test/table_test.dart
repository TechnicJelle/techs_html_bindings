import "package:techs_html_bindings/elements.dart";
import "package:test/test.dart";

void main() {
  group("Table tests", () {
    setUp(() {
      // Additional setup goes here.
    });

    test("1", () {
      final table = Table(
        head: TableHead(
          rows: [
            TableRowH(
              headers: [
                TableHeader(children: [T("a")]),
                TableHeader(children: [T("b")]),
              ],
            ),
            TableRowH(
              headers: [
                TableHeader(children: [T("c")]),
                TableHeader(children: [T("d")]),
                TableHeader(children: [T("e")]),
              ],
            ),
          ],
        ),
        body: TableBody(
          rows: [
            TableRowB(
              cells: [
                TableCell(children: [T("f")]),
                TableCell(children: [T("g")]),
              ],
            ),
            TableRowB(
              cells: [
                TableCell(children: [T("h")]),
                TableCell(children: [T("i")]),
              ],
            ),
            TableRowB(
              cells: [
                TableCell(children: [T("j")]),
                TableCell(children: [T("k")]),
              ],
            ),
            TableRowB(
              cells: [
                TableCell(children: [T("l")]),
                TableCell(children: [T("m")]),
                TableCell(children: [T("n")]),
              ],
            ),
            TableRowB(
              cells: [
                TableCell(children: [T("o")]),
                TableCell(children: [T("p")]),
              ],
            ),
          ],
        ),
      );
      final String text = HTML(
        lang: "en",
        head: Head(
          title: "Test",
          styles: [Style(css: tableCSS)],
        ),
        body: Body(
          header: Header(children: []),
          main: Main(children: [table]),
          footer: Footer(children: []),
        ),
      ).build();
      expect(text, isNotEmpty);
    });
  });
}

const String tableCSS = """
/* Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/table */
table {
  border: 1px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

caption {
  caption-side: bottom;
  padding: 10px;
  font-weight: bold;
}

thead,
tfoot {
  background-color: rgb(228 240 245);
}

th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

td:last-of-type {
  text-align: center;
}

tbody > tr:nth-of-type(even) {
  background-color: rgb(237 238 242);
}

tfoot th {
  text-align: right;
}

tfoot td {
  font-weight: bold;
}
""";
