// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../code.dart";

const Object _sentinel = Object();

abstract interface class _PreCopyWith {
  @useResult
  Pre call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _PreCopyWithImpl implements _PreCopyWith {
  final Pre _value;

  const _PreCopyWithImpl(this._value);

  @override
  Pre call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Pre(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension PreCopyWith on Pre {
  _PreCopyWith get copyWith => _PreCopyWithImpl(this);
}

abstract interface class _CodeCopyWith {
  @useResult
  Code call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _CodeCopyWithImpl implements _CodeCopyWith {
  final Code _value;

  const _CodeCopyWithImpl(this._value);

  @override
  Code call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Code(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension CodeCopyWith on Code {
  _CodeCopyWith get copyWith => _CodeCopyWithImpl(this);
}
