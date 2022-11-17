part of 'geolocation_bloc.dart';

///
/// flutter_geolocator_with_stream
/// File Name: geolocation_state
/// Created by sujangmac on 2022/11/17
///
/// Description:
///

abstract class GeolocationState extends Equatable {
  const GeolocationState();
  @override
  List<Object> get props => [];
}

class GeolocationInit extends GeolocationState {
  const GeolocationInit();
}

class GeolocationSuccess extends GeolocationState {
  final Position position;
  const GeolocationSuccess(this.position);

  @override
  List<Object> get props => [position];
}

class GeolocationDisposed extends GeolocationState {
  const GeolocationDisposed();
}
