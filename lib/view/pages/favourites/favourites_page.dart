import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_app/resources/extensions/app_extensions.dart';
import 'package:start_app/view_model/home/home_cubit.dart';

import '../../../resources/constants/app_assets.dart';
import '../../../resources/localization/generated/l10n.dart';
import '../../../resources/styles/app_colors.dart';
import '../../widgets/public_text.dart';
import '../../widgets/item_card.dart';

part 'components/favorite_view.dart';
part 'components/no_favorite_view.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = HomeCubit.getInstance(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60.h,
          title: PublicText(
            txt: S.of(context).favourites,
            fw: FontWeight.bold,
            size: 22.sp,
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (_, __) => bloc.favoirteItems.isEmpty,
          builder: (context, state) {
            return _getFavouriteView(bloc);
          },
        ),
      ),
    );
  }

  Widget _getFavouriteView(HomeCubit bloc) {
    if (bloc.favoirteItems.isEmpty) {
      return const NoFavoriteView();
    } else {
      return const FavoriteView();
    }
  }
}
