

import '../../models/home/current_booking_list_model.dart';
import '../../models/home/package_list_model.dart';

abstract class HomeRemoteDataSource {
  /// Fetches a list of popular movies from the remote data source.
  Future<List<PackageName>?> getHomePackages();
  Future<List<CurrentBooking>?> getCurrentBookings();
}