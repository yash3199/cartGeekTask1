import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';

class CommonCustomButton extends StatelessWidget {
  const CommonCustomButton({
    super.key,
    required this.icons,
    required this.buttonText,
    required this.onTap
  });

  final IconData icons;
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26.w,
        height: 3.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.h),
          color: AppColors.currentBookingButtonColor,
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(icons, size: 12, color: Colors.white,),
            const SizedBox(width: 3,),
            Text(buttonText, style: const TextStyle(color: Colors.white,fontSize: 10,fontFamily: 'AlegreyaSans'),)
          ],
        ),
      ),
    );
  }
}
