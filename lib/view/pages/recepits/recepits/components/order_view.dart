part of '../recepits_page.dart';

class OrderView extends StatelessWidget {
  final List<OrderEntity> orders;
  const OrderView({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      itemBuilder: (_, index) {
        return OrderCard(order: orders.reversed.toList()[index]);
      },
      separatorBuilder: (_, __) => 10.ph,
    );
  }
}
