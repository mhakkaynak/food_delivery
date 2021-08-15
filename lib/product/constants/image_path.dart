import '../../core/extension/string_extension.dart';

//* adini ImageConstants yapip core a da koyabilitsin
class ImagePath {
  static ImagePath _instance;
  static ImagePath get instance {
    _instance ??= ImagePath._init();
    return _instance;
  }

  ImagePath._init();
  final foodDeliveryIcon = 'food_delivery_icon'.toPng;
  final errorIcon = 'error'.toSvg;
}
