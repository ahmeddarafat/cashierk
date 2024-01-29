part of 'recepits_viewmodel.dart';

sealed class RecepitsState extends Equatable {
  const RecepitsState();

  @override
  List<Object> get props => [];
}

final class RecepitsInitState extends RecepitsState {
  const RecepitsInitState();
}

final class RecepitsSuccessState extends RecepitsState {
  final List<OrderEntity> orders;
  final DateTime expiredTime;

  const RecepitsSuccessState({required this.orders, required this.expiredTime});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orders': orders.map((order) => order.toMap()).toList(),
      'expiredTime': expiredTime.millisecondsSinceEpoch
    };
  }

  factory RecepitsSuccessState.fromMap(Map<String, dynamic> map) {
    return RecepitsSuccessState(
      orders: List<OrderEntity>.from(
        (map['orders'] as List<int>).map<OrderEntity>(
          (order) => OrderEntity.fromMap(order as Map<String, dynamic>),
        ),
      ),
      expiredTime:
          DateTime.fromMillisecondsSinceEpoch(map['expiredTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecepitsSuccessState.fromJson(String source) =>
      RecepitsSuccessState.fromMap(json.decode(source) as Map<String, dynamic>);
}

final class RecepitsLoadingState extends RecepitsState {
  const RecepitsLoadingState();
}

final class RecepitsErrorState extends RecepitsState {
  final String message;

  const RecepitsErrorState(this.message);

  @override
  List<Object> get props => [];
}
