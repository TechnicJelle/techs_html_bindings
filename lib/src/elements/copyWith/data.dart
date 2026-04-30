// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../data.dart";

const Object _sentinel = Object();

abstract interface class _AddressCopyWith {
  @useResult
  Address call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _AddressCopyWithImpl implements _AddressCopyWith {
  final Address _value;

  const _AddressCopyWithImpl(this._value);

  @override
  Address call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Address(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension AddressCopyWith on Address {
  _AddressCopyWith get copyWith => _AddressCopyWithImpl(this);
}

abstract interface class _TimeCopyWith {
  @useResult
  Time call({
    String datetime,
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _TimeCopyWithImpl implements _TimeCopyWith {
  final Time _value;

  const _TimeCopyWithImpl(this._value);

  @override
  Time call({
    Object? datetime,
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Time(
    datetime: datetime == null ? _value.datetime : datetime as String,
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension TimeCopyWith on Time {
  _TimeCopyWith get copyWith => _TimeCopyWithImpl(this);
}
