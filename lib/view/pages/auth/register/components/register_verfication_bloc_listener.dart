import 'dart:developer';

import 'package:cashier/resources/router/app_router.dart';
import 'package:cashier/view_model/auth/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../resources/styles/app_colors.dart';
import '../../../../widgets/public_snack_bar.dart';

class RegisterVerificationBlocListener extends StatelessWidget {
  const RegisterVerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (_, current) =>
          current is VerifyEmailLoadingState ||
          current is VerifyEmailSuccessState ||
          current is VerifyEmailErrorState,
      listener: (context, state) {
        log("State: $state");
        if (state is VerifyEmailLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is VerifyEmailSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.layouts,
            (_) => false,
          );
        } else if (state is VerifyEmailErrorState) {
          Navigator.pop(context);
          log("Error: ${state.error}");
          MySnackBar.error(
            message: state.error,
            color: AppColors.red,
            context: context,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
