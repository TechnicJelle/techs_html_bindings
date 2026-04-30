// dart format width=999

// These should not be used in the public API anyway.
// ignore_for_file: library_private_types_in_public_api

part of "../media.dart";

const Object _sentinel = Object();

abstract interface class _ImageCopyWith {
  @useResult
  Image call({
    String src,
    String alt,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
    int? width,
    int? height,
    Loading? loading,
    String? imageRoot,
    bool autoSize,
  });
}

class _ImageCopyWithImpl implements _ImageCopyWith {
  final Image _value;

  const _ImageCopyWithImpl(this._value);

  @override
  Image call({
    Object? src,
    Object? alt,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
    Object? width = _sentinel,
    Object? height = _sentinel,
    Object? loading = _sentinel,
    Object? imageRoot = _sentinel,
    Object? autoSize,
  }) => Image(
    src: src == null ? _value.src : src as String,
    alt: alt == null ? _value.alt : alt as String,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
    width: identical(width, _sentinel) ? _value.width : width as int?,
    height: identical(height, _sentinel) ? _value.height : height as int?,
    loading: identical(loading, _sentinel) ? _value.loading : loading as Loading?,
    imageRoot: identical(imageRoot, _sentinel) ? _value.imageRoot : imageRoot as String?,
    autoSize: autoSize == null ? _value.autoSize : autoSize as bool,
  );
}

extension ImageCopyWith on Image {
  _ImageCopyWith get copyWith => _ImageCopyWithImpl(this);
}

abstract interface class _VideoCopyWith {
  @useResult
  Video call({
    String src,
    int? width,
    int? height,
    bool autoplay,
    bool controls,
    Set<VideoControl>? controlsList,
    bool disablePictureInPicture,
    bool disableRemotePlayback,
    bool loop,
    bool muted,
    bool playsInline,
    bool tabFocusable,
    Loading? loading,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _VideoCopyWithImpl implements _VideoCopyWith {
  final Video _value;

  const _VideoCopyWithImpl(this._value);

  @override
  Video call({
    Object? src,
    Object? width = _sentinel,
    Object? height = _sentinel,
    Object? autoplay,
    Object? controls,
    Object? controlsList = _sentinel,
    Object? disablePictureInPicture,
    Object? disableRemotePlayback,
    Object? loop,
    Object? muted,
    Object? playsInline,
    Object? tabFocusable,
    Object? loading = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Video(
    src: src == null ? _value.src : src as String,
    width: identical(width, _sentinel) ? _value.width : width as int?,
    height: identical(height, _sentinel) ? _value.height : height as int?,
    autoplay: autoplay == null ? _value.autoplay : autoplay as bool,
    controls: controls == null ? _value.controls : controls as bool,
    controlsList: identical(controlsList, _sentinel) ? _value.controlsList : controlsList as Set<VideoControl>?,
    disablePictureInPicture: disablePictureInPicture == null ? _value.disablePictureInPicture : disablePictureInPicture as bool,
    disableRemotePlayback: disableRemotePlayback == null ? _value.disableRemotePlayback : disableRemotePlayback as bool,
    loop: loop == null ? _value.loop : loop as bool,
    muted: muted == null ? _value.muted : muted as bool,
    playsInline: playsInline == null ? _value.playsInline : playsInline as bool,
    tabFocusable: tabFocusable == null ? _value.tabFocusable : tabFocusable as bool,
    loading: identical(loading, _sentinel) ? _value.loading : loading as Loading?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension VideoCopyWith on Video {
  _VideoCopyWith get copyWith => _VideoCopyWithImpl(this);
}

abstract interface class _SourceCopyWith {
  @useResult
  Source call({
    String srcset,
    String? media,
    String? type,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _SourceCopyWithImpl implements _SourceCopyWith {
  final Source _value;

  const _SourceCopyWithImpl(this._value);

  @override
  Source call({
    Object? srcset,
    Object? media = _sentinel,
    Object? type = _sentinel,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Source(
    srcset: srcset == null ? _value.srcset : srcset as String,
    media: identical(media, _sentinel) ? _value.media : media as String?,
    type: identical(type, _sentinel) ? _value.type : type as String?,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension SourceCopyWith on Source {
  _SourceCopyWith get copyWith => _SourceCopyWithImpl(this);
}

abstract interface class _PictureCopyWith {
  @useResult
  Picture call({
    List<Source> sources,
    Image image,
    String? id,
    Iterable<String>? classes,
    Iterable<String>? inlineStyles,
  });
}

class _PictureCopyWithImpl implements _PictureCopyWith {
  final Picture _value;

  const _PictureCopyWithImpl(this._value);

  @override
  Picture call({
    Object? sources,
    Object? image,
    Object? id = _sentinel,
    Object? classes = _sentinel,
    Object? inlineStyles = _sentinel,
  }) => Picture(
    sources: sources == null ? _value.sources : sources as List<Source>,
    image: image == null ? _value.image : image as Image,
    id: identical(id, _sentinel) ? _value.id : id as String?,
    classes: identical(classes, _sentinel) ? _value.classes : classes as Iterable<String>?,
    inlineStyles: identical(inlineStyles, _sentinel) ? _value.inlineStyles : inlineStyles as Iterable<String>?,
  );
}

extension PictureCopyWith on Picture {
  _PictureCopyWith get copyWith => _PictureCopyWithImpl(this);
}
