import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/data/dummy_data/dummy_data.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/resources/router/app_router.dart';
import 'package:start_app/view/widgets/public_button.dart';
import 'package:start_app/view_model/recepits/recepits_viewmodel.dart';

import '../../../../data/models/recepits/order_model.dart';
import '../../../../resources/constants/app_assets.dart';
import '../../../../resources/localization/generated/l10n.dart';
import '../../../../resources/styles/app_colors.dart';
import '../../../widgets/public_snack_bar.dart';
import '../../../widgets/public_text.dart';

part 'components/no_order_view.dart';
part 'components/order_view.dart';
part 'components/order_card.dart';

class RecepitsPage extends StatefulWidget {
  const RecepitsPage({super.key});

  @override
  State<RecepitsPage> createState() => _RecepitsPageState();
}

class _RecepitsPageState extends State<RecepitsPage> {
  late final RecepitsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RecepitsViewModel.getInstance(context);
    _viewModel.getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecepitsViewModel, RecepitsState>(
      listener: (context, state) {
        if (state is RecepitsErrorState) {
          MySnackBar.error(
            message: state.message,
            color: AppColors.red,
            context: context,
          );
        }
      },
      builder: (context, state) {
        if (state is RecepitsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: PublicText(
                txt: S.of(context).orders,
                fw: FontWeight.bold,
                size: 22.sp,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Center(
                child: _getOrderView(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getOrderView() {
    // TODO: "Logic - check for order list here"
    if (_viewModel.allOrders.isEmpty) {
      return const NoOrderVeiw();
    } else {
      return const OrderView();
    }
  }
}
