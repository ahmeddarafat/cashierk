 part of '../discover_page.dart' ;

class ItemCard extends StatelessWidget {
  final Item item;
  
  const ItemCard({
    super.key, required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.backgroundGrey,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lightGrey,
            spreadRadius: 0.6,
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                item.image,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            10.ph,
            PublicText(txt: item.name),
            5.ph,
            PublicText(
              txt: item.amount,
              color: AppColors.grey,
              size: 14.sp,
            ),
            const Spacer(),
            PublicText(
              txt:
                  "\$ ${item.price.orAbout()}",
              color: AppColors.orangePrimary,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
