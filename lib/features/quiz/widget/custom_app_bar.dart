import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kQuizBGColor,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
