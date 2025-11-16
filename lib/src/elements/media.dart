import "dart:io";

import "package:image/image.dart" as img;
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

class Image extends Element {
  String src;
  String alt;
  int? width;
  int? height;

  bool autoSize;

  Image({
    required this.src,
    required this.alt,
    super.id,
    super.classes,
    super.inlineStyles,
    this.width,
    this.height,
    this.autoSize = true,
  }) : super(children: []);

  @override
  String build() {
    return '<img src="$src" alt="${alt.escape()}"$imageSize$modifiers>';
  }

  String get imageSize {
    if (width != null && height != null) {
      return " width=$width height=$height";
    }
    if (width != null) {
      return " width=$width";
    }
    if (height != null) {
      return " height=$height";
    }
    if (autoSize) {
      final file = File(src);
      if (file.existsSync()) {
        final img.Image? imageData = img.decodeImage(file.readAsBytesSync());
        if (imageData == null) return "";
        inlineStyles = [
          "max-width: 100%",
          "height: auto",
          "max-height: ${imageData.height}px",
          ...inlineStyles ?? [],
        ];
        return " width=${imageData.width} height=${imageData.height}";
      }
    }
    return "";
  }
}

enum VideoControl { noDownload, noFullscreen, noRemotePlayback }

extension ControlsListArg on Set<VideoControl>? {
  String arg({required bool controls}) {
    final Set<VideoControl>? set = this;
    if (set == null) return "";
    if (!controls) return "";
    return ' controlslist="${set.map((e) => e.name.toLowerCase()).join(" ")}"';
  }
}

class Video extends Element {
  String src;
  int? width;
  int? height;
  bool autoplay;
  bool controls;
  Set<VideoControl>? controlsList;
  bool disablePictureInPicture;
  bool disableRemotePlayback;
  bool loop;
  bool muted;
  bool playsInline;
  bool tabFocusable;

  Video({
    required this.src,
    this.width,
    this.height,
    this.autoplay = false,
    this.controls = false,
    this.controlsList,
    this.disablePictureInPicture = false,
    this.disableRemotePlayback = false,
    this.loop = false,
    this.muted = false,
    this.playsInline = false,
    this.tabFocusable = true,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: []) {
    if (autoplay && !muted) {
      throw Exception("Video cannot be autoplay if it isn't muted!");
    }
    if (controlsList != null && !controls) {
      throw Exception("ControlsList is defined, but controls is disabled!");
    }
  }

  @override
  String build() {
    return '<video src="$src"'
        '${autoplay.arg("autoplay")}'
        '${controls.arg("controls")}'
        "${controlsList.arg(controls: controls)}"
        '${disablePictureInPicture.arg("disablepictureinpicture")}'
        '${disableRemotePlayback.arg("disableremoteplayback")}'
        '${loop.arg("loop")}'
        '${muted.arg("muted")}'
        '${playsInline.arg("playsinline")}'
        '${tabFocusable ? 'tabindex="-1"' : ""}'
        "$imageSize$modifiers></video>";
  }

  String get imageSize {
    if (width != null && height != null) {
      return " width=$width height=$height";
    }
    if (width != null) {
      return " width=$width";
    }
    if (height != null) {
      return " height=$height";
    }
    return "";
  }
}
