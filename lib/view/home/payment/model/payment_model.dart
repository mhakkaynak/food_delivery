import 'package:food_delivery/core/base/model/base_model.dart';

class PaymentModel extends BaseModel {
  PaymentModel(this.deliveryMethod, this.paymentMethod);

  PaymentModel.empty();

  String deliveryMethod;
  String paymentMethod;
  double totalPrice;
  bool isSuccess;

  PaymentModel._fromJson(dynamic o) {
    deliveryMethod = o['deliveryMethod'].toString();
    paymentMethod = o['paymentMethod'].toString();
    totalPrice = double.tryParse(o['totalPrice'].toString());
    isSuccess = o['success'].toString() == 'true';
  }

  @override
  fromObject(json) => PaymentModel._fromJson(json);

  @override
  Map<String, dynamic> toMap() => {
        'deliveryMethod': this.deliveryMethod,
        'paymentMethod': this.paymentMethod,
        'totalPrice': this.totalPrice.toString(),
      };
}
