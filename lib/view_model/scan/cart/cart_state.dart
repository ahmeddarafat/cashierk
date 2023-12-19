part of 'cart_viewmodel.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitState extends CartState {
  const CartInitState();
}

final class CartSuccessState extends CartState {
  final String paymentToken;
  const CartSuccessState(this.paymentToken);
}

final class CartLoadingState extends CartState {
  const CartLoadingState();
}

final class CartErrorState extends CartState {
  final String message;

  const CartErrorState(this.message);

  @override
  List<Object> get props => [];
}
