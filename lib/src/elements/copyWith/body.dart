// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../body.dart";

const Object _sentinel = Object();

abstract interface class _BodyCopyWith {
  @useResult
  Body call({
    Header header,
    Main main,
    Footer footer,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _BodyCopyWithImpl implements _BodyCopyWith {
  final Body _value;

  const _BodyCopyWithImpl(this._value);

  @override
  Body call({
    Object? header,
    Object? main,
    Object? footer,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Body(
    header: header == null ? _value.header : header as Header,
    main: main == null ? _value.main : main as Main,
    footer: footer == null ? _value.footer : footer as Footer,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension BodyCopyWith on Body {
  _BodyCopyWith get copyWith => _BodyCopyWithImpl(this);
}

abstract interface class _HeaderCopyWith {
  @useResult
  Header call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _HeaderCopyWithImpl implements _HeaderCopyWith {
  final Header _value;

  const _HeaderCopyWithImpl(this._value);

  @override
  Header call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Header(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension HeaderCopyWith on Header {
  _HeaderCopyWith get copyWith => _HeaderCopyWithImpl(this);
}

abstract interface class _MainCopyWith {
  @useResult
  Main call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _MainCopyWithImpl implements _MainCopyWith {
  final Main _value;

  const _MainCopyWithImpl(this._value);

  @override
  Main call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Main(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension MainCopyWith on Main {
  _MainCopyWith get copyWith => _MainCopyWithImpl(this);
}

abstract interface class _FooterCopyWith {
  @useResult
  Footer call({
    Iterable<Element> children,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _FooterCopyWithImpl implements _FooterCopyWith {
  final Footer _value;

  const _FooterCopyWithImpl(this._value);

  @override
  Footer call({
    Object? children,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Footer(
    children: children == null ? _value.children : children as Iterable<Element>,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension FooterCopyWith on Footer {
  _FooterCopyWith get copyWith => _FooterCopyWithImpl(this);
}
