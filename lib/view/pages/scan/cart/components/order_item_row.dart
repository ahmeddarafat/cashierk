part of '../cart_page.dart';

class OrderItemRow extends StatelessWidget {
  final OrderItem item;
  const OrderItemRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 60.w,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.backgroundGrey,
          ),
          child: CachedNetworkImage(
            imageUrl: item.image,
            fit: BoxFit.fill,
            placeholder: (_, __) => const CircularProgressIndicator(),
            errorWidget: (_, __, ___) => const Icon(Icons.error),
          ),
        ),
        16.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PublicText(
              txt: item.name,
              size: 18.sp,
            ),
            4.ph,
            PublicText(
              txt: "Quntities: ${item.quantity}",
              color: AppColors.grey,
              size: 12.sp,
            ),
            4.ph,
            PublicText(
              txt: item.unitPrice,
              size: 14.sp,
            ),
          ],
        ),
        const Spacer(),
        PublicText(
          txt: "\$ ${item.totalPrice.orAbout()}",
        ),
      ],
    );
  }
}
