 part of '../order_details_page.dart' ;

class OverViewInfoRow extends StatelessWidget {
  final String title;
  final String description;
  const OverViewInfoRow({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PublicText(
            txt: title,
            color: AppColors.grey,
          ),
        ),
        const PublicText(
          txt: ":  ",
          color: AppColors.grey,
        ),
        Expanded(
          flex: 3,
          child: PublicText(
            txt: description,
            size: 14.sp,
            max: 4,
          ),
        ),
      ],
    );
  }
}