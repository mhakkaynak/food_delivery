part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  PaymentState({this.totalPrice, this.paymentMethod, this.deliveryMethod});

  final DeliveryMethod deliveryMethod;
  final PaymentMethod paymentMethod;
  final double totalPrice;

  @override
  List<Object> get props =>
      [this.deliveryMethod, this.paymentMethod, this.totalPrice];
}
