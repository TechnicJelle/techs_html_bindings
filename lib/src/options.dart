import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/utils.dart";

typedef HeadingIDGenerator = String Function(Hn heading);

/// Control what happens at construction time.
class ConstructOptions {
  //--- [Hn] Automatic IDs

  /// Whether [Hn]s should automatically get an ID based on their content.
  /// You can of course still set your own custom IDs, which will not be overwritten.
  static bool hAutoIDEnabled = true;

  /// Customise what the [Hn]'s ID will look like.
  /// You are provided the full, current [Hn], so you may generate the ID based on that.
  /// Only called when the [Hn] does not already have an ID set.
  static HeadingIDGenerator hAutoIDGenerator = defaultHAutoIDGenerator;

  static String defaultHAutoIDGenerator(Hn heading) => heading.innerText.clean();
}

typedef HeadingLinkGenerator = Element? Function(Hn heading);

/// Control what happens at build time.
class BuildOptions {
  /// Override this if you want to change the default globally.
  static BuildOptions def = BuildOptions();

  //--- [Hn] Automatic Links

  /// Whether [Hn]s should automatically get an [A] that links to them next to them if the [Hn] has an ID.
  /// This makes sharing links to headings easier.
  ///
  /// Use [hAutoLinkGenerator] to control what the inserted [Element] will look like.
  final bool hAutoLinkEnabled;

  /// Customise what the inserted [Element] will look like.
  /// You are provided the full, current [Hn], so you may generate the link based on that.
  /// Return `null` to not place anything.
  final HeadingLinkGenerator hAutoLinkGenerator;

  //--- [Image] Automatic Size

  /// Whether to automatically analyze an [Image]'s image file to fill in the [Image.width] & [Image.height].
  /// You can of course still set your own custom widths and heights, which will not be overwritten.
  ///
  /// Use [imgAutoSizeRoot] to control where to look from, in the case of relative paths and such.
  final bool imgAutoSizeEnabled;

  /// Where to look for images from when [imgAutoSizeEnabled] is true.
  /// You can also set the `TECHS_IMAGE_ROOT` environment variable in your build script.
  final String? imgAutoSizeRoot;

  //---

  BuildOptions({
    //--- [Hn] Automatic Links
    this.hAutoLinkEnabled = true,
    this.hAutoLinkGenerator = defaultHAutoLinkGenerator,
    //--- [Image] Automatic Size
    this.imgAutoSizeEnabled = true,
    this.imgAutoSizeRoot,
  });

  static Element? defaultHAutoLinkGenerator(Hn heading) =>
      heading.level == 2 || heading.level == 3 || heading.level == 4
      ? A.text("🔗", href: "#${heading.id}", classes: ["link"])
      : null;
}
