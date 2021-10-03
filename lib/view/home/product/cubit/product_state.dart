part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({  this.wasItLiked});

  final bool wasItLiked;

  @override
  List<Object> get props => [ wasItLiked];
}
