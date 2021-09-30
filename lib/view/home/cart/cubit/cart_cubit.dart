import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/constants/navigation/navigation_constant.dart';
import 'package:food_delivery/core/init/navigation/navigation_manager.dart';
import 'package:food_delivery/view/home/_model/food_model.dart';
import 'package:food_delivery/view/home/cart/model/cart_model.dart';
import 'package:food_delivery/view/home/cart/service/cart_service.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(products: [])) {
    getCart();
  }

  Future<void> likeFood(BuildContext context, String foodId) async {
    final response = await CartService.instance.likeFood(foodId);
    if (response != null)
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
  }

  Future<void> removeFromCart(String foodId) async {
    await CartService.instance.removeFromCart(foodId);
    getCart();
  }

  Future<void> increaseProductInCart(String foodId) async {
    await CartService.instance.increaseProductInCart(foodId);
    getCart();
  }

  Future<void> decreaseProductInCart(String foodId) async {
    await CartService.instance.decreaseProductInCart(foodId);
    getCart();
  }

  Future<void> goToProductView(FoodModel food) async {
    await NavigationManager.instance
        .navigationToPage(NavigationConstant.PRODUCT, args: food);
  }

  Future<void> goToPaymentView() async {
    await NavigationManager.instance
        .navigationToPage(NavigationConstant.PAYMENT);
  }

  Future<void> getCart() async {
    emit(CartState(products: await CartService.instance.getCart()));
  }
}
