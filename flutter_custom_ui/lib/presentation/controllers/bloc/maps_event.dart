part of 'maps_bloc.dart';

@immutable
abstract class MapsEvent {}

class InitialMaps extends MapsEvent {
  final LatLng currentPosition;
  final LatLng officePosition;
  InitialMaps({required this.currentPosition, required this.officePosition});
}
