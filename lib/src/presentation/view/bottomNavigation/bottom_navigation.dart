import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_cartgeek/src/core/utils/images_string.dart';
import 'package:sizer/sizer.dart';

import '../../../core/routes/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../controller/bottomNavigation/bottom_navigation_controller.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import '../package/package_view.dart';

class BottomNavigationPage extends StatelessWidget {
  final BottomNavController _controller = Get.put(BottomNavController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (_controller.currentIndex.value) {
          case 0:
            return const HomeView();
          case 1:
            return const PackageView();
          case 2:
            return const HomeView();
          case 3:
            return const HomeView();
          default:
            return const HomeView();
        }
      }),
      bottomNavigationBar: Obx(() {
        return SizedBox(
          height: 7.5.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){_controller.updateIndex(0);},
                child: Column(
                  children: [
                    SvgPicture.asset(AssetStrings.homeIcon,height: 3.h,color: _controller.currentIndex.value==0? AppColors.userNameColor:AppColors.greyText,),
                    //Icon(Icons.home_outlined,color: _controller.currentIndex.value==0? Colors.pink:Colors.grey,size: 30,),
                    Text("Home",style: TextStyle(fontFamily:'AlegreyaSans', color:  _controller.currentIndex.value==0? AppColors.userNameColor:AppColors.greyText,fontSize: 10,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){_controller.updateIndex(1);},
                child: Column(
                  children: [
                    SvgPicture.asset(AssetStrings.packageIcon,height: 3.h,color: _controller.currentIndex.value==1? AppColors.userNameColor:AppColors.greyText,),
                    //Icon(Icons.local_offer_outlined,color: _controller.currentIndex.value==1? Colors.pink:Colors.grey,size: 30),
                    Text("Packages",style: TextStyle(fontFamily:'AlegreyaSans', color: _controller.currentIndex.value==1? AppColors.userNameColor:AppColors.greyText,fontSize: 10,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){_controller.updateIndex(2);},
                child: Column(
                  children: [
                    SvgPicture.asset(AssetStrings.clockIcon,height: 3.h,color: _controller.currentIndex.value==2? AppColors.userNameColor:AppColors.greyText,),
                    // Icon(Icons.timer_outlined,color: _controller.currentIndex.value==2? Colors.pink:Colors.grey,size: 30),
                    Text("Booking",style: TextStyle(fontFamily:'AlegreyaSans',color: _controller.currentIndex.value==2? AppColors.userNameColor:AppColors.greyText,fontSize: 10,fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){_controller.updateIndex(3);},
                child: Column(
                  children: [
                    SvgPicture.asset(AssetStrings.userIcon,height: 3.h,color: _controller.currentIndex.value==3? AppColors.userNameColor:AppColors.greyText,),
                    //Icon(Icons.person_outlined,color: _controller.currentIndex.value==3? Colors.pink:Colors.grey,size: 30),
                    Text("Profile",style: TextStyle(fontFamily:'AlegreyaSans',color: _controller.currentIndex.value==3? AppColors.userNameColor:AppColors.greyText,fontSize: 10,fontWeight: FontWeight.w500)),
                  ],
                ),
              )
            ],
          ),
        );
      }
      ),
    );
  }
}