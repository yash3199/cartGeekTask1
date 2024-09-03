

import 'package:dio/dio.dart';

import '../../../domain/repositories/home/home_repository.dart';
import '../../datasource/home/home_remote_datasource.dart';
import '../../models/home/current_booking_list_model.dart';
import '../../models/home/package_list_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource,);

  //* REMOTE
  @override
  Future<List<PackageName>?> getHomePackages() async {
    try {
      return await _homeRemoteDataSource.getHomePackages();
    }on DioException  catch (e) {
      throw Exception(e.toString());
    }
  }


  @override
  Future<List<CurrentBooking>?> getCurrentBookings() async {
    try {
      return await _homeRemoteDataSource.getCurrentBookings();
    }on DioException  catch (e) {
      throw Exception(e.toString());
    }
  }


}