# Tech's HTML Bindings (Dart)

Very opinionated HTML bindings, for personal use in generating websites.

## Features

Write HTML in Dart, in a kind of Flutter-like style and export it to files.

Very opinionated, so if you don't like it, use something else.  
Maybe look into [Jaspr](https://pub.dev/packages/jaspr). I've heard it's good.

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
techs_html_bindings:
  git:
    url: https://github.com/TechnicJelle/techs_html_bindings.git
    ref: main
```

I might upload it on [pub.dev](https://pub.dev/) later, once it's more complete and tested.

## Usage

Short example:

```dart
final String html = HTML(
  lang: "en",
  head: Head(title: "Hello bindings!"),
  body: Body(
    header: Header(children: []),
    main: Main(
      children: [
        ...markdown(File("README.md")),
      ],
    ),
    footer: Footer(children: []),
  ),
).build();
```

A more complete example can be found in the [example](example) directory.

A full usage demonstration can be seen on my portfolio website: [github.com/TechnicJelle/TechnicJelle](https://github.com/TechnicJelle/TechnicJelle)

## Additional information

Feel free to make feature requests and PRs [on GitHub](https://github.com/TechnicJelle/techs_html_bindings).

But do not request anything related to JavaScript, because that is explicitly a non-goal for this library.
