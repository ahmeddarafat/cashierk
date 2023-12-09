part of '../recepits_page.dart';

class OrderView extends StatelessWidget {
  const OrderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: DummyData.orders.length,
      itemBuilder: (_, index) {
        return OrderCard(order: DummyData.orders[index]);
      },
      separatorBuilder: (_, __) => 20.ph,
    );
  }
}
