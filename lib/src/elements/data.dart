import "package:techs_html_bindings/elements.dart";

class Address extends Element {
  Address({
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  @override
  String build() {
    return "<address$modifiers>"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</address>";
  }
}

class Time extends Element {
  String datetime;

  Time({
    required this.datetime,
    required super.children,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  Time.text(
    String text, {
    required this.datetime,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [T(text)]);

  factory Time.now({
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  }) {
    final now = DateTime.now();
    return Time.text(
      now.copyWith(microsecond: 0).toIso8601String().replaceAll("T", " "),
      datetime: now.toIso8601String(),
      id: id,
      classes: classes,
      inlineStyles: inlineStyles,
    );
  }

  @override
  String build() {
    return '<time datetime="$datetime"$modifiers>'
        "${children.map((el) => el.build()).join()}"
        "</time>";
  }
}
