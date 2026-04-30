import "package:meta/meta.dart";
import "package:techs_html_bindings/elements.dart";

part "copyWith/lists.dart";

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
  lowercaseLetters("a"),
  uppercaseLetters("A"),
  lowercaseRomanNumerals("i"),
  uppercaseRomanNumerals("I"),
  numbers("1")
  ;

  final String value;

  const OrderedListType(this.value);
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
    if (type != null) modifiers += ' type="${type!.value}"';

    return "<ol$modifiers>\n"
        '${children.map((el) => el.build()).join("\n")}\n'
        "</ol>";
  }
}
