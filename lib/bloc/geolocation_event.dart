part of 'geolocation_bloc.dart';

///
/// flutter_geolocator_with_stream
/// File Name: geolocation_event
/// Created by sujangmac on 2022/11/17
///
/// Description:
///

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();
  @override
  List<Object> get props => [];
}

class StartGeolocation extends GeolocationEvent {}

class UpdateGeolocation extends GeolocationEvent {
  final Position position;
  const UpdateGeolocation(this.position);

  @override
  List<Object> get props => [position];
}

class CompleteGeolocation extends GeolocationEvent {}
