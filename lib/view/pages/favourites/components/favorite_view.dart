part of '../favourites_page.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = HomeCubit.getInstance(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (_, current) => current is ChangeFavoriteState,
        builder: (context, state) {
          return GridView.builder(
            itemCount: bloc.favoirteItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 170 / 220,
            ),
            itemBuilder: (_, index) {
              return ItemCard(item: bloc.favoirteItems[index]);
            },
          );
        },
      ),
    );
  }
}