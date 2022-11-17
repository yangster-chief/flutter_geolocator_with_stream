import 'package:geolocator/geolocator.dart';

///
/// flutter_geolocator_with_stream
/// File Name: base_geo_repository
/// Created by sujangmac on 2022/11/17
///
/// Description:
///
abstract class BaseGeoRepository {
  Future<Position?> getCurrentLocation();
}
