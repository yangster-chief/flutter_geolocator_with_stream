import 'package:geolocator/geolocator.dart';

///
/// flutter_geolocator_with_stream
/// File Name: geo_repository
/// Created by sujangmac on 2022/11/17
///
/// Description:
///
class GeoRepository {
  final GeolocatorPlatform _geolocator;

  const GeoRepository(this._geolocator);

  Stream<Position> getCurrentLocation() => _geolocator.getPositionStream(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high),
      );
}
