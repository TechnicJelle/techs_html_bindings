import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";
import "package:techs_html_bindings/src/utils.dart";

part "copyWith/iframe.dart";

enum ReferrerPolicy {
  noReferrer("no-referrer"),
  noReferrerWhenDowngrade("no-referrer-when-downgrade"),
  origin("origin"),
  originWhenCrossOrigin("origin-when-cross-origin"),
  sameOrigin("same-origin"),
  strictOrigin("strict-origin"),
  strictOriginWhenCrossOrigin("strict-origin-when-cross-origin"),
  unsafeUrl("unsafe-url")
  ;

  final String value;

  const ReferrerPolicy(this.value);

  static ReferrerPolicy? fromString(String? s) => values.fromStringMapped(s, (e) => e.value);
}

enum Sandbox {
  allowDownloads("allow-downloads"),
  allowForms("allow-forms"),
  allowModals("allow-modals"),
  allowOrientationLock("allow-orientation-lock"),
  allowPointerLock("allow-pointer-lock"),
  allowPopups("allow-popups"),
  allowPopupsToEscapeSandbox("allow-popups-to-escape-sandbox"),
  allowPresentation("allow-presentation"),
  allowSameOrigin("allow-same-origin"),
  allowScripts("allow-scripts"),
  allowStorageAccessByUserActivation("allow-storage-access-by-user-activation"),
  allowTopNavigation("allow-top-navigation"),
  allowTopNavigationByUserActivation("allow-top-navigation-by-user-activation"),
  allowTopNavigationToCustomProtocols("allow-top-navigation-to-custom-protocols")
  ;

  final String value;

  const Sandbox(this.value);

  static Sandbox? fromString(String? s) => values.fromStringMapped(s, (e) => e.value);
}

class IFrame extends Element {
  String src;
  String title;
  int? width;
  int? height;
  Loading? loading;
  String? allow;
  ReferrerPolicy? referrerPolicy;
  Set<Sandbox>? sandbox;

  IFrame({
    required this.src,
    required this.title,
    this.width,
    this.height,
    this.loading,
    this.allow,
    this.referrerPolicy,
    this.sandbox,
    super.id,
    super.classes,
    Iterable<String>? inlineStyles,
  }) : super(
         inlineStyles: ["border: 0", ...?inlineStyles],
         children: [],
       );

  @override
  String build() {
    String modifiers = this.modifiers;
    if (loading != null) modifiers += ' loading="${loading!.name}"';
    if (allow != null) modifiers += ' allow="$allow"';
    if (referrerPolicy != null) modifiers += ' referrerpolicy="${referrerPolicy!.value}"';
    if (sandbox != null) modifiers += ' sandbox="${sandbox!.map((el) => el.value).join(" ")}"';
    return '<iframe src="$src" title="$title"$imageSize$modifiers></iframe>';
  }

  String get imageSize {
    if (width != null && height != null) {
      return ' width="$width" height="$height"';
    }
    if (width != null) {
      return ' width="$width"';
    }
    if (height != null) {
      return ' height="$height"';
    }
    return "";
  }
}
