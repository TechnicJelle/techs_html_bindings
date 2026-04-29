import "dart:io";

import "package:image/image.dart" as img;
import "package:path/path.dart" as p;
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/options.dart";
import "package:techs_html_bindings/utils.dart";

enum Loading { eager, lazy }

class Image extends Element {
  String src;
  String alt;
  int? width;
  int? height;
  Loading? loading;

  Image({
    required this.src,
    required this.alt,
    super.id,
    super.classes,
    super.inlineStyles,
    this.width,
    this.height,
    this.loading,
  }) : super(children: []);

  @override
  String build({BuildOptions? buildOptions}) {
    buildOptions ??= BuildOptions.def;
    String modifiers = this.modifiers;
    if (loading != null) modifiers += ' loading="${loading!.name}"';
    return '<img src="$src" alt="${alt.escape()}"$getImageSize(buildOptions)$modifiers />';
  }

  String getImageSize(BuildOptions buildOptions) {
    if (width != null && height != null) {
      return " width=$width height=$height";
    }
    if (width != null) {
      return " width=$width";
    }
    if (height != null) {
      return " height=$height";
    }
    if (buildOptions.imgAutoSizeEnabled) {
      final String? imageRoot = buildOptions.imgAutoSizeRoot ?? Platform.environment["TECHS_IMAGE_ROOT"];
      final file = imageRoot == null ? File(src) : File(p.join(imageRoot, src));
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
  Loading? loading;

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
    this.loading,
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
  String build({BuildOptions? buildOptions}) {
    String modifiers = this.modifiers;
    if (loading != null) modifiers += ' loading="${loading!.name}"';
    return '<video src="$src"'
        '${autoplay.arg("autoplay")}'
        '${controls.arg("controls")}'
        "${controlsList.arg(controls: controls)}"
        '${disablePictureInPicture.arg("disablepictureinpicture")}'
        '${disableRemotePlayback.arg("disableremoteplayback")}'
        '${loop.arg("loop")}'
        '${muted.arg("muted")}'
        '${playsInline.arg("playsinline")}'
        '${tabFocusable ? "" : ' tabindex="-1"'}'
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

class Source extends Element {
  String srcset;
  String? media;
  String? type;

  Source({
    required this.srcset,
    this.media,
    this.type,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: const Iterable.empty());

  @override
  String build({BuildOptions? buildOptions}) {
    String modifiers = this.modifiers;
    if (media != null) modifiers += ' media="$media"';
    if (type != null) modifiers += ' type="$type"';

    return '<source srcset="$srcset"$modifiers />';
  }
}

class Picture extends Element {
  List<Source> sources;
  Image image;

  Picture({
    required this.sources,
    required this.image,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: const Iterable.empty());

  /// default is light
  Picture.lightDark({
    required String lightSrc,
    required String darkSrc,
    required String alt,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : sources = [Source(srcset: darkSrc, media: "(prefers-color-scheme: dark)")],
       image = Image(src: lightSrc, alt: alt),
       super(children: const Iterable.empty());

  /// default is dark
  Picture.darkLight({
    required String lightSrc,
    required String darkSrc,
    required String alt,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : sources = [Source(srcset: lightSrc, media: "(prefers-color-scheme: light)")],
       image = Image(src: darkSrc, alt: alt),
       super(children: const Iterable.empty());

  @override
  String build({BuildOptions? buildOptions}) {
    return "<picture$modifiers>\n"
        '\t${sources.map((s) => s.build(buildOptions: buildOptions)).join("\n\t")}\n'
        "\t${image.build(buildOptions: buildOptions)}\n"
        "</picture>";
  }
}
