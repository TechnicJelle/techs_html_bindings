// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../head.dart";

const Object _sentinel = Object();

abstract interface class _HeadCopyWith {
  @useResult
  Head call({
    String title,
    Iterable<Meta>? metas,
    Iterable<Link>? links,
    Iterable<Style>? styles,
  });
}

class _HeadCopyWithImpl implements _HeadCopyWith {
  final Head _value;

  const _HeadCopyWithImpl(this._value);

  @override
  Head call({
    Object? title,
    Object? metas = _sentinel,
    Object? links = _sentinel,
    Object? styles = _sentinel,
  }) => Head(
    title: title == null ? _value.title : title as String,
    metas: identical(metas, _sentinel) ? _value.metas : metas as Iterable<Meta>?,
    links: identical(links, _sentinel) ? _value.links : links as Iterable<Link>?,
    styles: identical(styles, _sentinel) ? _value.styles : styles as Iterable<Style>?,
  );
}

extension HeadCopyWith on Head {
  _HeadCopyWith get copyWith => _HeadCopyWithImpl(this);
}

abstract interface class _StyleCopyWith {
  @useResult
  Style call({
    String css,
  });
}

class _StyleCopyWithImpl implements _StyleCopyWith {
  final Style _value;

  const _StyleCopyWithImpl(this._value);

  @override
  Style call({
    Object? css,
  }) => Style(
    css: css == null ? _value.css : css as String,
  );
}

extension StyleCopyWith on Style {
  _StyleCopyWith get copyWith => _StyleCopyWithImpl(this);
}
