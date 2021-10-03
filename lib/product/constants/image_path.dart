import '../../core/extension/string_extension.dart';

//* adini ImageConstants yapip core a da koyabilitsin
class ImagePath {
  ImagePath._init();

  final bankIcon = 'bank'.toSvg;
  final cardIcon = 'card'.toSvg;
  final errorIcon = 'error'.toSvg;
  final doorDeliveryIcon = 'door_delivery'.toSvg;
  final pickUpIcon = 'pick_up'.toSvg;
  final userIcon = 'user'.toSvg;
  final foodDeliveryIcon = 'food_delivery_icon'.toPng;
  final splashImage = 'splash'.toPng;

  static ImagePath _instance;

  static ImagePath get instance {
    _instance ??= ImagePath._init();
    return _instance;
  }
}
