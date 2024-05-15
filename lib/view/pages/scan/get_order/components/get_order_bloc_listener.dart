import 'package:cashier/resources/router/app_router.dart';
import 'package:cashier/view_model/scan/waiting/wating_state.dart';
import 'package:cashier/view_model/scan/waiting/wating_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../resources/styles/app_colors.dart';
import '../../../../widgets/public_snack_bar.dart';

class GetOrderBlocListener extends StatelessWidget {
  const GetOrderBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WaitingViewModel, WaitingState>(
      listenWhen: (_, current) =>
          current is OrderLoadingState ||
          current is OrderCompleteState ||
          current is OrderErrorState,
      listener: (context, state) {
        if (state is OrderLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is OrderCompleteState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.waiting,
            (route) => route.settings.name == AppRoutes.layouts,
          );
        } else if (state is OrderErrorState) {
          Navigator.pop(context);
          MySnackBar.error(
            message: state.message,
            color: AppColors.red,
            context: context,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
