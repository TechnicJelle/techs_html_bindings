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
  });
}
