import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/database/database_manager.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../product/constants/enum/payment_enum.dart';
import '../../../authentication/entry/model/user_model.dart';
import '../model/payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit()
      : super(PaymentState(
            paymentMethod: PaymentMethod.CARD,
            deliveryMethod: DeliveryMethod.DOOR_DELIVERY,
            totalPrice: 0.0)) {
    _init();
  }

  double _totalPrice;
  String _userId;

  void changePaymentMethod(
          PaymentMethod paymentMethod, DeliveryMethod deliveryMethod) =>
      emit(PaymentState(
          paymentMethod: paymentMethod,
          deliveryMethod: deliveryMethod,
          totalPrice: _totalPrice));

  void changeDeliveryMethod(
          DeliveryMethod deliveryMethod, PaymentMethod paymentMethod) =>
      emit(PaymentState(
          deliveryMethod: deliveryMethod,
          paymentMethod: paymentMethod,
          totalPrice: _totalPrice));

  Future<void> pay(
      PaymentModel model, VoidCallback messageFun(String text)) async {
    final response = await NetworkManager.instance
        .post('/payment/$_userId', model) as PaymentModel;
    if (response.isSuccess) {
      messageFun('Your order has been received');
    } else {
      messageFun('Failed plase try again');
    }
    _goToHomeView();
  }

  void _goToHomeView() {
    NavigationManager.instance.navigationToPage(NavigationConstant.HOME);
  }

  Future<void> _init() async {
    _userId =
        (await DbManager.instance.fetchUser(UserModel.empty()) as UserModel).id;
    _getTotalPrice();
  }

  Future<void> _getTotalPrice() async {
    final result = await NetworkManager.instance.fetch(
        '/payment/getTotalPrice/$_userId',
        model: PaymentModel.empty()) as PaymentModel;
    _totalPrice = result.totalPrice;
    emit(PaymentState(totalPrice: _totalPrice));
  }
}
