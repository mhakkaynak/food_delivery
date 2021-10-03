import '../../../../core/base/model/base_model.dart';

class PaymentModel extends BaseModel {
  PaymentModel(this.deliveryMethod, this.paymentMethod);

  PaymentModel._fromJson(dynamic o) {
    deliveryMethod = o['deliveryMethod'].toString();
    paymentMethod = o['paymentMethod'].toString();
    totalPrice = double.tryParse(o['totalPrice'].toString());
    isSuccess = o['success'].toString() == 'true';
  }

  PaymentModel.empty();

  String deliveryMethod;
  bool isSuccess;
  String paymentMethod;
  double totalPrice;

  @override
  PaymentModel fromObject(json) => PaymentModel._fromJson(json);

  @override
  Map<String, dynamic> toMap() => {
        'deliveryMethod': this.deliveryMethod,
        'paymentMethod': this.paymentMethod,
        'totalPrice': this.totalPrice.toString(),
      };
}
