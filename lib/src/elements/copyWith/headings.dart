// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../headings.dart";

const Object _sentinel = Object();

abstract interface class _HnCopyWith {
  @useResult
  Hn call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _HnCopyWithImpl implements _HnCopyWith {
  final Hn _value;

  const _HnCopyWithImpl(this._value);

  @override
  Hn call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => Hn.fromLevel(
    level: _value.level,
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension HnCopyWith on Hn {
  _HnCopyWith get copyWith => _HnCopyWithImpl(this);
}

abstract interface class _H1CopyWith {
  @useResult
  H1 call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _H1CopyWithImpl implements _H1CopyWith {
  final H1 _value;

  const _H1CopyWithImpl(this._value);

  @override
  H1 call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => H1(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension H1CopyWith on H1 {
  _H1CopyWith get copyWith => _H1CopyWithImpl(this);
}

abstract interface class _H2CopyWith {
  @useResult
  H2 call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _H2CopyWithImpl implements _H2CopyWith {
  final H2 _value;

  const _H2CopyWithImpl(this._value);

  @override
  H2 call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => H2(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension H2CopyWith on H2 {
  _H2CopyWith get copyWith => _H2CopyWithImpl(this);
}

abstract interface class _H3CopyWith {
  @useResult
  H3 call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _H3CopyWithImpl implements _H3CopyWith {
  final H3 _value;

  const _H3CopyWithImpl(this._value);

  @override
  H3 call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => H3(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension H3CopyWith on H3 {
  _H3CopyWith get copyWith => _H3CopyWithImpl(this);
}

abstract interface class _H4CopyWith {
  @useResult
  H4 call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _H4CopyWithImpl implements _H4CopyWith {
  final H4 _value;

  const _H4CopyWithImpl(this._value);

  @override
  H4 call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => H4(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension H4CopyWith on H4 {
  _H4CopyWith get copyWith => _H4CopyWithImpl(this);
}

abstract interface class _H5CopyWith {
  @useResult
  H5 call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _H5CopyWithImpl implements _H5CopyWith {
  final H5 _value;

  const _H5CopyWithImpl(this._value);

  @override
  H5 call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => H5(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension H5CopyWith on H5 {
  _H5CopyWith get copyWith => _H5CopyWithImpl(this);
}

abstract interface class _H6CopyWith {
  @useResult
  H6 call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    bool autoID,
    bool autoLink,
  });
}

class _H6CopyWithImpl implements _H6CopyWith {
  final H6 _value;

  const _H6CopyWithImpl(this._value);

  @override
  H6 call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? autoID,
    Object? autoLink,
  }) => H6(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    autoID: autoID == null ? _value.autoID : autoID as bool,
    autoLink: autoLink == null ? _value.autoLink : autoLink as bool,
  );
}

extension H6CopyWith on H6 {
  _H6CopyWith get copyWith => _H6CopyWithImpl(this);
}
