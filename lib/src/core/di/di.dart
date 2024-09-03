


import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/home/home_remote_datasource.dart';
import '../../data/datasource/home/home_remote_datasource_impl.dart';
import '../../data/repositories/home/home_repository_impl.dart';
import '../../domain/repositories/home/home_repository.dart';
import '../../domain/usecases/home/home_usecase.dart';
import '../../presentation/controller/home/home_controller.dart';
import '../dioServices/dio_services.dart';

final sl = GetIt.instance;

void init() {
  /// Cubit
  // sl.registerFactory<HomeUseCases>(
  //         () => HomeUseCases(sl()));

   // sl.registerFactory<DioClient>(
   //        () => DioClient());



    Get.put(DioClient());

   // Register HomeRemoteDataSourceImpl as HomeRemoteDataSource
   Get.put<HomeRemoteDataSource>(HomeRemoteDataSourceImpl(Get.find<DioClient>()));

   // Register HomeRepositoryImpl as HomeRepository
   Get.put<HomeRepository>(HomeRepositoryImpl(Get.find<HomeRemoteDataSource>()));

   // Register HomeUseCases with HomeRepository injected
   Get.put(HomeUseCases(Get.find<HomeRepository>()));

    Get.put(HomeController(Get.find<HomeUseCases>()));
}
