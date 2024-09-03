import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_cartgeek/src/core/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/images_string.dart';
import '../../controller/home/home_controller.dart';
import '../../widgets/home/current_booking_widget.dart';
import '../../widgets/home/drawer_options.dart';
import '../../widgets/home/packages_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Drawer (Slides in from the left)
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: controller.isDrawerOpened.value
                ? 0
                : -MediaQuery.of(context).size.width * 0.5, // Move drawer out of screen
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                SizedBox(height:14.h),
                Container(
                  height: 9.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.userNameColor!, // Border color
                      width: 3.0,        // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(AssetStrings.female),
                  ),
                ),
                 Text("Emily Cyrus",style: TextStyle(color: AppColors.userNameColor,fontSize: 20,fontFamily: 'AlegreyaSans',fontWeight: FontWeight.w700),),
                SizedBox(height: 5.h,),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "Home",),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "Book A Nanny",),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "How It Works",),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "Why Nanny Vanny",),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "My Bookings",),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "My Profile",),
                DrawerOptions(onTap: (){controller.toggleDrawer();},text: "Support",),
              ],
            ),
          )),
          // Main Content
          SlideTransition(
            position: controller.slideAnimation,
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              controller.toggleDrawer();
                            },
                            child: SvgPicture.asset(AssetStrings.menuIcon,height: 4.h,)),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 7.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.userNameColor!, // Border color
                                width: 3.0,        // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(AssetStrings.female),
                            ),
                          ),
                          SizedBox(width: 2.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Welcome",style: TextStyle(fontFamily:'AlegreyaSans',fontSize: 16),),
                              Text("Emily Cyrus",style: TextStyle(color: AppColors.userNameColor,fontSize: 20,fontFamily:'AlegreyaSans',fontWeight: FontWeight.w700),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 50.h,
                        height: 25.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 50.h,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.cardOneColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nanny And \nBabysitting Services",style: TextStyle(color:  AppColors.currentBookingButtonColor, fontSize: 20,fontWeight:FontWeight.w700,fontFamily:'AlegreyaSans'),),
                                    SizedBox(height: 2.h,),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 25.w,
                                          height: 3.5.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2.h),
                                            color:  AppColors.currentBookingButtonColor,
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Book Now", style: TextStyle(color: Colors.white,fontFamily:'AlegreyaSans'),)
                                            ],

                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: -3.h,
                              bottom: -3.h,
                              child: SvgPicture.asset(
                                AssetStrings.mother,// Path to your SVG file
                                height: 28.h,// Specify the height
                                width: 10.w,// Specify the width
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 3.h,),
                      Text(
                        "Your current booking",
                        style: TextStyle(color: AppColors.currentBookingButtonColor,fontWeight:FontWeight.w700,fontSize: 20,fontFamily:'AlegreyaSans'),
                      ),
                      SizedBox(height: 2.h,),
                      Obx(() {
                        if(controller.currentBookingLoading.value==true){
                          return  Center(child: CircularProgressIndicator(color: AppColors.cardOneColor,),);
                        }else {
                          if (controller.currentBookingsList.isNotEmpty) {
                            return
                              ListView.builder(
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return CurrentBookingWidget(
                                      title: controller
                                          .currentBookingsList[index].title ??
                                          "Na",
                                      fromDate: controller
                                          .currentBookingsList[index]
                                          .fromDate ?? "Na",
                                      fromTime: controller
                                          .currentBookingsList[index]
                                          .fromTime ?? "Na",
                                      toDate: controller
                                          .currentBookingsList[index].toDate ??
                                          "Na",
                                      toTime: controller
                                          .currentBookingsList[index].toTime ??
                                          "Na",
                                    );
                                  });
                          } else {
                            return const Text("No Current Bookings to show",style: TextStyle(fontFamily:'AlegreyaSans'),);
                          }
                        }
                      }
                      ),
                      SizedBox(height: 3.h,),
                      Text(
                        "Packages",
                        style: TextStyle(color:  AppColors.currentBookingButtonColor,fontWeight: FontWeight.w700,fontSize: 20,fontFamily:'AlegreyaSans'),
                      ),
                      SizedBox(height: 2.h,),
                      Obx((){
                        if(controller.packagesLoading.value==true){
                          return Center(child: CircularProgressIndicator(color: AppColors.packageBlueButtonColor,),);
                        }else {
                          if (controller.packageList.isNotEmpty) {
                            return ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return PackagesWidget(
                                    price: "\u20B9 ${controller
                                        .packageList[index].price}",
                                    headingText: controller.packageList[index]
                                        .title ?? "NA",
                                    index: index + 1,
                                    mainText: controller.packageList[index]
                                        .desc ?? "Lorem ipsum text",);
                                }
                            );
                          } else {
                            return const Text("No packages to show",style: TextStyle(fontFamily:'AlegreyaSans'),);
                          }
                        }
                      }
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // Floating action button to toggle the drawer

    );
  }
}
