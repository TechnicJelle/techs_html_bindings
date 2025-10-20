import "dart:io";

import "package:techs_html_bindings/src/markdown.dart";
import "package:techs_html_bindings/techs_html_bindings.dart";

void main() {
  File("index.html").writeAsStringSync(
    HTML(
      lang: "en",
      head: Head(
        title: "Hello bindings!",
        styles: [
          Style(
            css: """
header nav ul {
	display: flex;
	list-style-type: none;
	gap: 1em;
}

.italic {
	font-style: italic;
}

/* Anchor point for the headings' autoLink feature */
h2, h3, h4 {
	position: relative;
}
h2 > a.link, h3 > a.link, h4 > a.link {
	display: none;
	text-decoration: none;
}
h2:hover > a.link, h3:hover > a.link, h4:hover > a.link {
	display: inline;
	position: absolute; /* Do not actually take up any space, to prevent layout shifts */
}
          """,
          ),
        ],
      ),
      body: Body(
        header: Header(
          children: [
            Nav(
              children: [
                UnorderedList(
                  items: [
                    generateNavItem("One"),
                    generateNavItem("Two"),
                    generateNavItem("Three"),
                  ],
                ),
              ],
            ),
          ],
        ),
        main: Main(
          children: [
            ...markdown(File("README.md")),
          ],
        ),
        footer: Footer(
          classes: ["italic"],
          children: [
            P(
              children: [
                T("Website last updated on"),
                Time(
                  inlineStyles: ["color: red"],
                  datetime: DateTime.now().toIso8601String(),
                  visible: DateTime.now().copyWith(microsecond: 0).toIso8601String().replaceAll("T", " "),
                ),
              ],
            ),
          ],
        ),
      ),
    ).build(),
  );
}

ListItem generateNavItem(String num) => ListItem(
  children: [
    A(href: "#", children: [T("Item $num")]),
  ],
);
