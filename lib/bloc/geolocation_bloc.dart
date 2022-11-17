import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

///
/// flutter_geolocator_with_stream
/// File Name: geolocation_bloc
/// Created by sujangmac on 2022/11/17
///
/// Description:
///
part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc(super.initialState) {}
}
