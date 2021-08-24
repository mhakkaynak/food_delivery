part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({this.index});
  final int index;
  @override
  List<Object> get props => [this.index];
}
