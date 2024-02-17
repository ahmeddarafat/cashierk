part of '../notifications_page.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        var bloc = context.read<NotificationCubit>();
        return ListView.builder(
          itemCount: bloc.notifications.length,
          itemBuilder: (_, index) => NotificationCard(
            // TODO: logic - enhance
            notification: bloc.notifications.reversed.toList()[index],
          ),
        );
      },
    );
  }
}
