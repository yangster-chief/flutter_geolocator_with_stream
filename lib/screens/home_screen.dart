import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geolocator_with_stream/bloc/geolocation_bloc.dart';
import 'package:flutter_geolocator_with_stream/repositories/geo_repository.dart';
import 'package:geolocator/geolocator.dart';

///
/// flutter_geolocator_with_stream
/// File Name: home_screen
/// Created by sujangmac on 2022/11/17
///
/// Description:
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => GeolocationBloc(
          GeoRepository(GeolocatorPlatform.instance),
        ),
        child: Scaffold(
            appBar: AppBar(title: const Text('Geolocator with Stream')),
            body: const HomeView()),
      );
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    final geoBloc = context.read<GeolocationBloc>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: BlocBuilder<GeolocationBloc, GeolocationState>(
            builder: (context, state) {
              if (state is GeolocationSuccess) {
                return Text(
                    '${state.position.latitude}, ${state.position.longitude}');
              }
              return Text('is not running');
            },
          ),
        ),
        const SizedBox(height: 32),
        OutlinedButton(
            onPressed: () async {
              if (!_isListening) {
                final serviceEnabled =
                    await Geolocator.isLocationServiceEnabled();
                if (!serviceEnabled) {
                  return;
                }
                LocationPermission permission =
                    await Geolocator.checkPermission();
                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.denied) {
                    return Future.error('Location permissions are denied');
                  }
                }
                if (permission == LocationPermission.deniedForever) {
                  // Permissions are denied forever, handle appropriately.
                  return Future.error(
                      'Location permissions are permanently denied, we cannot request permissions.');
                }
                setState(() {
                  _isListening = !_isListening;
                });
                geoBloc.add(StartGeolocation());
              }
            },
            child: Text(_isListening ? 'is running' : 'click here')),
      ],
    );
  }
}
