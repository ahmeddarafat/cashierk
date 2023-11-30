part of '../discover_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.h,
          decoration: BoxDecoration(
            color: category.color,
            shape: BoxShape.circle,
          ),
          child: Image.asset(category.image),
        ),
        10.ph,
        PublicText(
          txt: category.name,
          size: 14.sp,
        )
      ],
    );
  }
}
