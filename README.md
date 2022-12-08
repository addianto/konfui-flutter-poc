# konfui_poc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Generating Data Classes

This project uses [Freezed](https://pub.dev/packages/freezed) and [`build_runner`](https://pub.dev/packages/build_runner) to generate the data classes.
Create or update a data class in the corresponding `model.dart` source code file.
Make sure the data class is annotated with `@freezed`.
Then, generate the boilerplate code by using `build_runner`:

```shell
flutter pub run build_runner build
```

## License

[MIT](./LICENSE.md).