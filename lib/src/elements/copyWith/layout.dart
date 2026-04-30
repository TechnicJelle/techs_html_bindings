// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../layout.dart";

const Object _sentinel = Object();

abstract interface class _DivCopyWith {
  @useResult
  Div call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    Map<String, String?>? args,
  });
}

class _DivCopyWithImpl implements _DivCopyWith {
  final Div _value;

  const _DivCopyWithImpl(this._value);

  @override
  Div call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? args = _sentinel,
  }) => Div(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    args: identical(args, _sentinel) ? _value.args : args as Map<String, String?>?,
  );
}

extension DivCopyWith on Div {
  _DivCopyWith get copyWith => _DivCopyWithImpl(this);
}

abstract interface class _SectionCopyWith {
  @useResult
  Section call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _SectionCopyWithImpl implements _SectionCopyWith {
  final Section _value;

  const _SectionCopyWithImpl(this._value);

  @override
  Section call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Section(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension SectionCopyWith on Section {
  _SectionCopyWith get copyWith => _SectionCopyWithImpl(this);
}

abstract interface class _NavCopyWith {
  @useResult
  Nav call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _NavCopyWithImpl implements _NavCopyWith {
  final Nav _value;

  const _NavCopyWithImpl(this._value);

  @override
  Nav call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Nav(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension NavCopyWith on Nav {
  _NavCopyWith get copyWith => _NavCopyWithImpl(this);
}

abstract interface class _AsideCopyWith {
  @useResult
  Aside call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _AsideCopyWithImpl implements _AsideCopyWith {
  final Aside _value;

  const _AsideCopyWithImpl(this._value);

  @override
  Aside call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Aside(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension AsideCopyWith on Aside {
  _AsideCopyWith get copyWith => _AsideCopyWithImpl(this);
}
