import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_colors.dart';
import 'commom_button.dart';

class CurrentBookingWidget extends StatelessWidget {
  const CurrentBookingWidget({
    super.key,
    required this.title,
    required this.fromDate,
    required this.toDate,
    required this.fromTime,
    required this.toTime
  });

  final String title;
  final String fromDate;
  final String fromTime;
  final String toDate;
  final String toTime;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 5, // Spread radius (how wide the shadow spreads)
            blurRadius: 8, // Blur radius (how blurry the shadow is)
            offset: const Offset(1, 3), // Shadow position (x, y)
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(color:AppColors.userNameColor,fontSize: 16,fontFamily: 'AlegreyaSans',fontWeight: FontWeight.w500),),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 25.w,
                    height: 3.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.h),
                      color: AppColors.userNameColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Start", style: TextStyle(color: Colors.white,fontFamily: 'AlegreyaSans',fontSize: 12),)
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
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                   Text("from",style: TextStyle(fontFamily: 'AlegreyaSans',fontSize: 12,color: AppColors.currentBookingTextColor),),
                  SizedBox(height: 0.8.h,),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: AppColors.userNameColor,size: 15),
                      SizedBox(width: 1.w,),
                       Text(fromDate,style: TextStyle(fontFamily: 'AlegreyaSans',fontSize: 16,color: AppColors.currentBookingTextColor),)
                    ],
                  ),
                  SizedBox(height: 0.8.h,),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined,color: AppColors.userNameColor,size: 15),
                      SizedBox(width: 1.w,),
                       Text(fromTime,style:  TextStyle(fontFamily: 'AlegreyaSans',fontSize: 16,color: AppColors.currentBookingTextColor),)
                    ],
                  )
                ],
              ),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text("To",style: TextStyle(fontFamily: 'AlegreyaSans',fontSize: 12,color: AppColors.currentBookingTextColor),),
                  SizedBox(height: 0.8.h,),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: AppColors.userNameColor,size: 15,),
                      SizedBox(width: 1.w,),
                       Text(toDate,style: TextStyle(fontFamily: 'AlegreyaSans',fontSize: 16,color: AppColors.currentBookingTextColor),)
                    ],
                  ),
                  SizedBox(height: 0.8.h,),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined,color: AppColors.userNameColor,size: 15),
                      SizedBox(width: 1.w,),
                      Text(toTime,style: TextStyle(fontFamily: 'AlegreyaSans',fontSize: 16,color: AppColors.currentBookingTextColor),)
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonCustomButton(icons: Icons.star,buttonText: "Rate Us",onTap: (){print("Rate us button pressed");},),
              CommonCustomButton(icons: Icons.location_on,buttonText: "Geolocation",onTap: (){print("geolocation button pressed");}),
              CommonCustomButton(icons: Icons.diamond,buttonText: "Survillence",onTap: (){print("survillence button pressed");}),
            ],
          )
        ],
      ),
    );;
  }
}
