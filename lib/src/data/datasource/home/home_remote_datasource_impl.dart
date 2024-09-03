import '../../../core/dioServices/dio_exceptions.dart';
import '../../../core/dioServices/dio_services.dart';
import '../../models/home/current_booking_list_model.dart';
import '../../models/home/package_list_model.dart';
import 'home_remote_datasource.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient _dioClient;

  const HomeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<PackageName>?> getHomePackages() async {
    try {
      final response = await _dioClient.get("/packages_list");
      // List<dynamic> posts = response.data;
      // return posts.map((postMap)=> PackageListModel.fromJson(postMap)).toList();
      final data = PackageListModel.fromJson(response.data);
      return data.responses;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }


  @override
  Future<List<CurrentBooking>?> getCurrentBookings() async {
    try {
      final response = await _dioClient.get("/current_booking_list");
      final data = CurrentBookingListModel.fromJson(response.data);
      return data.response;
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(e.code, e.message);
      } else {
        throw Exception(e.toString());
      }
    }
  }

}