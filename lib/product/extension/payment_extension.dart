import '../constants/enum/payment_enum.dart';

extension PaymentMethodExtension on PaymentMethod {
  String get rawValue {
    switch (this) {
      case PaymentMethod.BANK_ACCOUNT:
        return 'Bank account';
      case PaymentMethod.CARD:
        return 'Card';
      default:
        return 'Card';
    }
  }
}

extension DeliveryMethodExtension on DeliveryMethod {
  String get rawValue {
    switch (this) {
      case DeliveryMethod.DOOR_DELIVERY:
        return 'Door delivery';
      case DeliveryMethod.PICK_UP:
        return 'Pick up';
      default:
        return 'Door delivery';
    }
  }
}
