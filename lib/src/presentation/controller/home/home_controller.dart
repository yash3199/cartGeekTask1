import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../data/models/home/current_booking_list_model.dart';
import '../../../data/models/home/package_list_model.dart';
import '../../../domain/usecases/home/home_usecase.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  var isDrawerOpened = false.obs;
  var packageList = <PackageName>[].obs;
  var currentBookingsList = <CurrentBooking>[].obs;
  late AnimationController drawerAnimationController;
  final HomeUseCases homeUseCases;
  var currentBookingLoading= false.obs;
  var packagesLoading= false.obs;
  HomeController(this.homeUseCases);

  @override
  void onInit() {
    super.onInit();
    getPackageList();
    getCurrentBookings();
    drawerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void onClose() {
    drawerAnimationController.dispose();
    super.onClose();
  }

  void getPackageList()  async{
    packagesLoading.value = true;
    try {
      final response = await homeUseCases.getHomePackages();
      if(response!=null){
        packageList.assignAll(response);
      }

    }catch(e){
      print("error is $e");

    }finally{
      packagesLoading.value=false;
    }
    }

  void getCurrentBookings()  async{
    currentBookingLoading.value = true;
    try {
      final response = await homeUseCases.getCurrentBookings();
      if(response!=null){
        currentBookingsList.assignAll(response);
      }

    }catch(e){
      print("error is $e");

    }finally{
      currentBookingLoading.value=false;
    }
  }



  void toggleDrawer() {
    if (isDrawerOpened.value) {
      drawerAnimationController.reverse();
    } else {
      drawerAnimationController.forward();
    }
    isDrawerOpened.value = !isDrawerOpened.value;
  }

  Animation<Offset> get slideAnimation => Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0.5, 0.0), // Slide half the screen to the right
  ).animate(CurvedAnimation(
    parent: drawerAnimationController,
    curve: Curves.easeInOut,
  ));
}