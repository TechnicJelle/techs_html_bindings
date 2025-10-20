import "dart:io";

import "package:techs_html_bindings/elements.dart";

//TODO: Make not terrible

const String _h1 = "# ";
const String _h2 = "## ";
const String _h3 = "### ";
const String _h4 = "#### ";
const String _h5 = "##### ";
const String _h6 = "###### ";
const _commentStart = "<!-- ";
const _commentEnd = "-->";

List<Element> markdown(File file) {
  final List<String> contents = file.readAsLinesSync();
  final List<Element> elements = [];
  bool disabled = false;

  for (int i = 0; i < contents.length; i++) {
    final String line = contents[i];

    if (line.endsWith(_commentEnd)) {
      disabled = false;
      continue;
    } else if (line.startsWith(_commentStart)) {
      disabled = true;
    }

    if (disabled) continue;

    if (line.startsWith(_h1)) {
      elements.add(H1(children: [T(line.replaceFirst(_h1, ""))]));
    } else if (line.startsWith(_h2)) {
      elements.add(H2(children: [T(line.replaceFirst(_h2, ""))]));
    } else if (line.startsWith(_h3)) {
      elements.add(H2(children: [T(line.replaceFirst(_h3, ""))]));
    } else if (line.startsWith(_h4)) {
      elements.add(H2(children: [T(line.replaceFirst(_h4, ""))]));
    } else if (line.startsWith(_h5)) {
      elements.add(H2(children: [T(line.replaceFirst(_h5, ""))]));
    } else if (line.startsWith(_h6)) {
      elements.add(H2(children: [T(line.replaceFirst(_h6, ""))]));
    } else {
      final RegExp image = RegExp(r"!\[(.*?)\]\((.*?)\)");
      final RegExp link = RegExp(r"\[(.*?)\]\((.*?)\)");
      final List<RegExpMatch> imageMatches = image.allMatches(line).toList();
      final List<RegExpMatch> linkMatches = link.allMatches(line).toList();
      if (imageMatches.isNotEmpty) {
        for (final Match match in imageMatches) {
          elements.add(Image(src: match.group(2)!, alt: match.group(1)!));
        }
      } else if (linkMatches.isNotEmpty) {
        for (final Match match in linkMatches) {
          elements.add(
            A(href: match.group(2)!, children: [T(match.group(1)!)]),
          );
        }
      } else {
        elements.add(P.text(line));
      }
    }
  }

  return elements;
}
