import "package:techs_html_bindings/elements.dart";

class ListItem extends Element {
  String? value;

  ListItem({
    required super.children,
    this.value,
    super.id,
    super.classes,
    super.inlineStyles,
  });

  ListItem.text(
    String text, {
    this.value,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: [T(text)]);

  @override
  String build() {
    String modifiers = this.modifiers;
    if (value != null) modifiers += ' value="$value"';

    return "<li$modifiers>"
        '${children.map((el) => el.build()).join("\n")}'
        "</li>";
  }
}

class UnorderedList extends Element {
  Iterable<ListItem> items;

  UnorderedList({
    required this.items,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: items);

  @override
  String build() {
    return "<ul$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</ul>";
  }
}

enum OrderedListType {
  lowercaseLetters,
  uppercaseLetters,
  lowercaseRomanNumerals,
  uppercaseRomanNumerals,
  numbers
  ;

  @override
  String toString() {
    return switch (this) {
      OrderedListType.lowercaseLetters => "a",
      OrderedListType.uppercaseLetters => "A",
      OrderedListType.lowercaseRomanNumerals => "i",
      OrderedListType.uppercaseRomanNumerals => "I",
      OrderedListType.numbers => "1",
    };
  }
}

class OrderedList extends Element {
  Iterable<ListItem> items;
  OrderedListType? type;

  OrderedList({
    required this.items,
    this.type,
    super.id,
    super.classes,
    super.inlineStyles,
  }) : super(children: items);

  @override
  String build() {
    String modifiers = this.modifiers;
    if (type != null) modifiers += ' type="$type"';

    return "<ol$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</ol>";
  }
}
