![Flutter Text Decorator Logo][logo_banner]

[![License: MIT][license_badge]][license_link]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

Bring your words to life leveraging flutter_text_decorator with wavy underlines, colorful boxes, speech bubbles and more. Whether you want to highlight important details, add a playful touch or simply stand out. The package makes it easy to add personality and flair to your text.

Developed with 💯 Passion by [**exxeta**](https://www.exxeta.com)

## Features

- ✅ Boxes
- ✅ Underline
- ✅ Wavy Box
- ✅ Speech Bubble

Feel free to check out the [Example App](./example) and play around.

## Quick Start 🚀

1.  **Add `flutter_text_decorator` to your `pubspec.yaml`**

    ```yaml
    dependencies:
      flutter_text_decorator:
    ```

2.  **Run the following terminal command to install the package:**
    ```sh
    flutter pub get
    ```

3.  **Import the package into your Dart file**

    ```sh
    import 'package:flutter_text_decorator/flutter_text_decorator.dart';
    ```

4.  **Use TextDecorator**

    Here is a simple example of how you can use `TextDecorator.boxed`:
    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_text_decorator/flutter_text_decorator.dart';

    class MyDecoratedWidget extends StatelessWidget {
      const MyDecoratedWidget({super.key});

      @override
      Widget build(BuildContext context) {
        return Center(
          child: TextDecorator.boxed(
            style: BoxStyle.rounded,
            text: const Text(
              'Hello Decorated World!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            color: Colors.blueAccent,
            strokeWidth: 2,
          ),
        );
      }
    }
    ```


## Styles Preview

<table>
  <tr>
    <td align="center">
      <h3>Box Decorator</h3>
      <img src="./documentation/img/box.png" alt="Box Decorator Example" width="80%">
    </td>
    <td align="center">
      <h3>Circle Decorator</h3>
      <img src="./documentation/img/circle.png" alt="Circle Decorator Example" width="80%">
    </td>
  </tr>
  <tr>
    <td align="center">
      <h3>Underline Decorator</h3>
      <img src="./documentation/img/underline.png" alt="Underline Decorator Example" width="80%">
    </td>
    <td align="center">
      <h3>Highlight Decorator</h3>
      <img src="./documentation/img/highlight.png" alt="Highlight Decorator Example" width="80%">
    </td>
  </tr>
</table>


## Planned features 🎯

We're always thinking of new ways to make text decoration even more fun and versatile! Our next big idea is to introduce a **Comic effect** to bring a playful, graphic-novel style to your Flutter apps. Stay tuned for this and other enhancements.


## Contributing
We love new ideas and contributions from the community! If you have a suggestion, a bug report, or want to contribute code, please check out our [CONTRIBUTING](./CONTRIBUTING.md) guide to get started. Your input helps make `flutter_text_decorator` even better!


## Authors 

Authors:

- [Tobias Rump](https://github.com/TobiasRump)
- [Jonas Klock](https://github.com/jay-k98)

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

[logo_banner]: ./documentation/img/flutter_text_decorator_banner.png
[license_link]: https://opensource.org/licenses/MIT
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_ventures_link]: https://verygood.ventures
