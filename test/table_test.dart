import "package:techs_html_bindings/elements.dart";
import "package:test/test.dart";

void main() {
  group("Table tests", () {
    setUp(() {
      // Additional setup goes here.
    });

    test("1", () {
      // Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/td
      final table = Table(
        head: TableHead(
          rows: [
            TableRow(
              cells: [
                TableHeader(children: [T("Player")]),
                TableHeader(children: [T("Gloobles")]),
                TableHeader(children: [T("Za'taak")]),
              ],
            ),
          ],
        ),
        body: TableBody(
          rows: [
            TableRow(
              cells: [
                TableHeader(children: [T("TR-7")]),
                TableData(children: [T("7")]),
                TableData(children: [T("4,569")]),
              ],
            ),
            TableRow(
              cells: [
                TableHeader(children: [T("Khiresh Odo")]),
                TableData(children: [T("7")]),
                TableData(children: [T("7,223")]),
              ],
            ),
            TableRow(
              cells: [
                TableHeader(children: [T("Mia Oolong")]),
                TableData(children: [T("9")]),
                TableData(children: [T("6,219")]),
              ],
            ),
          ],
        ),
      );
      final text = inHtml(table, table1CSS);
      expect(text, isNotEmpty);
    });

    test("2", () {
      final table = Table(
        head: TableHead(
          rows: [
            TableRow(
              cells: [
                TableHeader(children: [T("a")]),
                TableHeader(children: [T("b")]),
              ],
            ),
            TableRow(
              cells: [
                TableHeader(children: [T("c")]),
                TableHeader(children: [T("d")]),
                TableHeader(children: [T("e")]),
              ],
            ),
          ],
        ),
        body: TableBody(
          rows: [
            TableRow(
              cells: [
                TableData(children: [T("f")]),
                TableData(children: [T("g")]),
              ],
            ),
            TableRow(
              cells: [
                TableData(children: [T("h")]),
                TableData(children: [T("i")]),
              ],
            ),
            TableRow(
              cells: [
                TableData(children: [T("j")]),
                TableData(children: [T("k")]),
              ],
            ),
            TableRow(
              cells: [
                TableData(children: [T("l")]),
                TableData(children: [T("m")]),
                TableData(children: [T("n")]),
              ],
            ),
            TableRow(
              cells: [
                TableData(children: [T("o")]),
                TableData(children: [T("p")]),
              ],
            ),
          ],
        ),
      );
      final String text = inHtml(table, table2CSS);
      expect(text, isNotEmpty);
    });
  });
}

String inHtml(Element element, String css) {
  return HTML(
    lang: "en",
    head: Head(
      title: "Test",
      styles: [Style(css: css)],
    ),
    body: Body(
      header: Header(children: []),
      main: Main(children: [element]),
      footer: Footer(children: []),
    ),
  ).build();
}

const String table1CSS = """
/* Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/td */
th,
td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}

th[scope="col"] {
  background-color: #505050;
  color: white;
}

th[scope="row"] {
  background-color: #d6ecd4;
}

td {
  text-align: center;
}

tr:nth-of-type(even) {
  background-color: #eeeeee;
}

table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

caption {
  caption-side: bottom;
  padding: 10px;
}
""";

const String table2CSS = """
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
