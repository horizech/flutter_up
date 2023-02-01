import 'dart:async';

import 'package:flutter/cupertino.dart';

class UpImageHelper {
  static Future<Size> calculateImageDimension(Image image) {
    Completer<Size> completer = Completer();

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }
}
