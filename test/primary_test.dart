// These are necessary for the tests
// ignore_for_file: avoid_redundant_argument_values

import "package:techs_html_bindings/elements.dart";
import "package:test/test.dart";

void main() {
  group("Primary tests", () {
    setUp(() {
      // Additional setup goes here.
    });

    test("Basic HTML", () {
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

    test("Video Element", () {
      expect(() => Video(src: "", autoplay: true, muted: false), throwsException);
      expect(() => Video(src: "", controls: false, controlsList: {}), throwsException);

      final text = Video(
        src: "https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4",
        autoplay: true,
        muted: true,
        controls: true,
        controlsList: {VideoControl.noDownload, VideoControl.noRemotePlayback, VideoControl.noFullscreen},
        disablePictureInPicture: true,
        disableRemotePlayback: true,
        loop: true,
        playsInline: true,
        tabFocusable: false,
        width: 640,
        height: 360,
      ).build();
      expect(text, isNotEmpty);
    });

    test("Ordered List Types", () {
      final ol = OrderedList(
        type: .lowercaseLetters,
        items: [
          ListItem(children: [T("one")]),
          ListItem(children: [T("two")]),
          ListItem(children: [T("three")]),
        ],
      ).build();
      expect(ol, isNotEmpty);
    });
  });

  test("Picture Element", () {
    final lightDarkManual = Picture(
      sources: [
        Source(
          media: "(prefers-color-scheme: dark)",
          srcset: "assets/dark/promo.png",
        ),
      ],
      image: Image(
        src: "assets/light/promo.png",
        alt: "Promotional image",
      ),
    ).build();

    final lightDarkAuto = Picture.lightDark(
      lightSrc: "assets/light/promo.png",
      darkSrc: "assets/dark/promo.png",
      alt: "Promotional image",
    ).build();

    expect(lightDarkManual, lightDarkAuto);

    final darkLightAuto = Picture.darkLight(
      lightSrc: "assets/light/promo.png",
      darkSrc: "assets/dark/promo.png",
      alt: "Promotional image",
    ).build();
    expect(darkLightAuto, isNotEmpty);

    final pictureTyped = Picture(
      sources: [
        Source(srcset: "photo.avif", type: "image/avif"),
        Source(srcset: "photo.webp", type: "image/webp"),
      ],
      image: Image(src: "photo.jpg", alt: "photo"),
    ).build();
    expect(pictureTyped, isNotEmpty);
  });
}
