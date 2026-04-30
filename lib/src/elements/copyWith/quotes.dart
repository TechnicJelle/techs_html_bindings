// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../quotes.dart";

const Object _sentinel = Object();

abstract interface class _BlockQuoteCopyWith {
  @useResult
  BlockQuote call({
    Iterable<Element> children,
    String? cite,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _BlockQuoteCopyWithImpl implements _BlockQuoteCopyWith {
  final BlockQuote _value;

  const _BlockQuoteCopyWithImpl(this._value);

  @override
  BlockQuote call({
    Object? children,
    Object? cite = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => BlockQuote(
    children: children == null ? _value.children : children as Iterable<Element>,
    cite: identical(cite, _sentinel) ? _value.cite : cite as String?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension BlockQuoteCopyWith on BlockQuote {
  _BlockQuoteCopyWith get copyWith => _BlockQuoteCopyWithImpl(this);
}

abstract interface class _QCopyWith {
  @useResult
  Q call({
    Iterable<Element> children,
    String? cite,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _QCopyWithImpl implements _QCopyWith {
  final Q _value;

  const _QCopyWithImpl(this._value);

  @override
  Q call({
    Object? children,
    Object? cite = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Q(
    children: children == null ? _value.children : children as Iterable<Element>,
    cite: identical(cite, _sentinel) ? _value.cite : cite as String?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension QCopyWith on Q {
  _QCopyWith get copyWith => _QCopyWithImpl(this);
}
