part of 'maps_bloc.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class ResultMaps extends MapsState {
  final LatLng currentPosition;
  final LatLng officePosition;
  ResultMaps({required this.currentPosition, required this.officePosition});
}
