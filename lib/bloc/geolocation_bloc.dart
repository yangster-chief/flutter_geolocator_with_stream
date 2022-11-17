import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geolocator_with_stream/repositories/geo_repository.dart';
import 'package:geolocator/geolocator.dart';

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
  final GeoRepository _repository;
  GeolocationBloc(this._repository) : super(const GeolocationInit()) {
    on<StartGeolocation>(
      (event, emit) async {
        await emit.onEach<Position>(
          _repository.getCurrentLocation(),
          onData: (position) => add(UpdateGeolocation(position)),
        );
        emit(const GeolocationDisposed());
      },
      transformer: restartable(),
    );

    on<UpdateGeolocation>(
      (event, emit) {
        emit(GeolocationSuccess(event.position));
      },
    );
  }
}
