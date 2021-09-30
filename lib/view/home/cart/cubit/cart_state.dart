part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({this.products});
  final List<CartModel> products;
  @override
  List<Object> get props => [this.products];
}
