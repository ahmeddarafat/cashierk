import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:start_app/resources/constants/app_assets.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/resources/styles/app_colors.dart';
import 'package:start_app/view/widgets/public_text.dart';
import 'package:start_app/view_model/scan/waiting/wating_state.dart';
import 'package:start_app/view_model/scan/waiting/wating_viewmodel.dart';

import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/router/app_router.dart';
import '../../../widgets/public_snack_bar.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({super.key});

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  late final WaitingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = WaitingViewModel.getInstance(context);
    _viewModel.getOrderItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WaitingViewModel, WaitingState>(
      listener: (context, state) {
        if (state is WaitingErrorState) {
          MySnackBar.error(
            message: state.message,
            color: AppColors.red,
            context: context,
          );
        } else if (state is WaitingCompleteState) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.cart,
            arguments: _viewModel.order,
          );
        }
      },
      child: _waitingContent(context),
    );
  }
}

Widget _waitingContent(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                Assets.jsonsLoading,
                height: 150.w,
                width: 150.w,
              ),
              10.ph,
              PublicText(
                txt: S.of(context).pleaseWait,
                size: 24.sp,
                fw: FontWeight.bold,
                letterSpacing: 2.8.h,
              ),
              20.ph,
              PublicText(
                txt: S.of(context).waitingSubtitle,
                size: 20.sp,
                color: AppColors.grey,
                align: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
