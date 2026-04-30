// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../lists.dart";

const Object _sentinel = Object();

abstract interface class _ListItemCopyWith {
  @useResult
  ListItem call({
    Iterable<Element> children,
    String? value,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _ListItemCopyWithImpl implements _ListItemCopyWith {
  final ListItem _value;

  const _ListItemCopyWithImpl(this._value);

  @override
  ListItem call({
    Object? children,
    Object? value = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => ListItem(
    children: children == null ? _value.children : children as Iterable<Element>,
    value: identical(value, _sentinel) ? _value.value : value as String?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension ListItemCopyWith on ListItem {
  _ListItemCopyWith get copyWith => _ListItemCopyWithImpl(this);
}

abstract interface class _UnorderedListCopyWith {
  @useResult
  UnorderedList call({
    Iterable<ListItem> items,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _UnorderedListCopyWithImpl implements _UnorderedListCopyWith {
  final UnorderedList _value;

  const _UnorderedListCopyWithImpl(this._value);

  @override
  UnorderedList call({
    Object? items,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => UnorderedList(
    items: items == null ? _value.items : items as Iterable<ListItem>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension UnorderedListCopyWith on UnorderedList {
  _UnorderedListCopyWith get copyWith => _UnorderedListCopyWithImpl(this);
}

abstract interface class _OrderedListCopyWith {
  @useResult
  OrderedList call({
    Iterable<ListItem> items,
    OrderedListType? type,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _OrderedListCopyWithImpl implements _OrderedListCopyWith {
  final OrderedList _value;

  const _OrderedListCopyWithImpl(this._value);

  @override
  OrderedList call({
    Object? items,
    Object? type = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => OrderedList(
    items: items == null ? _value.items : items as Iterable<ListItem>,
    type: identical(type, _sentinel) ? _value.type : type as OrderedListType?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension OrderedListCopyWith on OrderedList {
  _OrderedListCopyWith get copyWith => _OrderedListCopyWithImpl(this);
}
