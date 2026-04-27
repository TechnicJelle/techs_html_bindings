import "dart:io";

import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/markdown.dart";
import "package:techs_html_bindings/src/utils.dart";
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

  test("Inline HTML Video", () {
    const String strMarkdown = """
# Inline HTML Video Test

<video src="dQw4w9WgXcQ.mp4" autoplay muted loop></video>

This concludes the Inline HTML Video Test.
""";
    final List<Element> elements = markdown(strMarkdown);
    expect(elements, isNotEmpty);
    final List<Video> videos = [];
    elements.collectOfType(into: videos);
    expect(videos, isNotEmpty);
    final Video video = videos.first;

    expect(video.src, "dQw4w9WgXcQ.mp4");
    expect(video.autoplay, isTrue);
    expect(video.muted, isTrue);
    expect(video.loop, isTrue);
  });

  test("Inline HTML Image", () {
    const String strMarkdown = """
# Inline HTML Image Test

<img src="logo-128.gif" alt="animated version of my logo" width=128 height=128>

This concludes the Inline HTML Image Test.
""";
    final List<Element> elements = markdown(strMarkdown);
    expect(elements, isNotEmpty);
    final List<Image> images = [];
    elements.collectOfType(into: images);
    expect(images, isNotEmpty);
    final Image image = images.first;

    expect(image.src, "logo-128.gif");
    expect(image.alt, "animated version of my logo");
    expect(image.width, 128);
    expect(image.height, 128);
  });

  test("Comments", () {
    const String strMarkdown = """
# Comments Test

<!---->
<!-- -->
<!--  -->
<!-- a -->
<!--HTML comment-->
<!-- HTML comment -->

That was an HTML comment.

<!----->
<!--- -->
<!---  -->
<!--- a -->
<!---Markdown comment-->
<!--- Markdown comment -->

That was a Markdown comment.

This concludes the Inline HTML Video Test.
""";
    final List<Element> elements = markdown(strMarkdown);
    expect(elements, isNotEmpty);
    final String html = Div(children: elements).build();
    expect(html, contains("<!--"));
    expect(html, isNot(contains(RegExp("<!---[^-]"))));
  });
}
