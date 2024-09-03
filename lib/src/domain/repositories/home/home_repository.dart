

import '../../../data/models/home/current_booking_list_model.dart';
import '../../../data/models/home/package_list_model.dart';

abstract class HomeRepository {

  /// Retrieves the popular movies from the server.
  Future<List<PackageName>?> getHomePackages();
  Future<List<CurrentBooking>?> getCurrentBookings();
}