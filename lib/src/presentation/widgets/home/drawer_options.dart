import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/app_colors.dart';


class DrawerOptions extends StatelessWidget {
  const DrawerOptions({
    super.key,
    required this.text,
    required this.onTap
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: onTap,
            child: Text(text,style: TextStyle(color: AppColors.currentBookingButtonColor,fontSize:18 ,fontFamily: 'AlegreyaSans'),)),
        SizedBox(height: 1.h,),
        SizedBox(
            width: 35.w,
            child: Divider(color: AppColors.userNameColor,)),
      ],
    );
  }
}