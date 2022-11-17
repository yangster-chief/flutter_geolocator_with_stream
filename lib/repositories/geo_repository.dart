import 'package:flutter_geolocator_with_stream/repositories/base_geo_repository.dart';
import 'package:geolocator/geolocator.dart';

///
/// flutter_geolocator_with_stream
/// File Name: geo_repository
/// Created by sujangmac on 2022/11/17
///
/// Description:
///
class GeoRepository extends BaseGeoRepository {
  GeoRepository();

  @override
  Future<Position?> getCurrentLocation() async =>
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
}
