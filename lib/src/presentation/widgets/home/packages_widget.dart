import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_cartgeek/src/core/utils/images_string.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';

class PackagesWidget extends StatelessWidget {
  const PackagesWidget({
    super.key,
    required this.price,
    required this.headingText,
    required this.index,
    required this.mainText
  });

  final String price;
  final String headingText;
  final int index;
  final String mainText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index%2==0? AppColors.packageBlueColor:AppColors.packagePinkColor ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(index%2==0? AssetStrings.whiteCalendarIcon:AssetStrings.calendarIcon,height: 4.h,),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 25.w,
                    height: 3.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.h),
                      color:  index%2==0? AppColors.packageBlueButtonColor:AppColors.userNameColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book Now", style: TextStyle(color: Colors.white,fontSize: 12),)
                      ],

                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(headingText,style: TextStyle(fontSize: 16,color:  AppColors.currentBookingButtonColor,fontWeight: FontWeight.w500),),
              Text(price,style: TextStyle(fontSize: 16,color:  AppColors.currentBookingButtonColor,fontWeight: FontWeight.w700))
            ],
          ),
          SizedBox(height: 1.5.h,),
          Text( mainText,
            style: TextStyle(fontSize: 10,color: AppColors.greyText,fontWeight: FontWeight.w400),
          )
        ],
      ),
    );


  }
}
