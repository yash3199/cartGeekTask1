

import 'package:flutter/cupertino.dart';

import '../../../data/models/home/current_booking_list_model.dart';
import '../../../data/models/home/package_list_model.dart';
import '../../repositories/home/home_repository.dart';

class HomeUseCases {
  final   HomeRepository _homeRepository;
  const HomeUseCases(this._homeRepository);

  //* REMOTE
  /// This method gets popular movies from the remote data source.
  Future<List<PackageName>?> getHomePackages() async {
    try {
      return await _homeRepository.getHomePackages();
    } catch (e) {
      debugPrint("Error caught in USE CASE ====> $e");
    }
  }


  Future<List<CurrentBooking>?> getCurrentBookings() async {
    try {
      return await _homeRepository.getCurrentBookings();
    } catch (e) {
      debugPrint("Error caught in USE CASE ====> $e");
    }
  }



}