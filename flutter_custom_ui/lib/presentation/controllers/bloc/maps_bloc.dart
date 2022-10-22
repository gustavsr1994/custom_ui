import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsInitial()) {
    on<InitialMaps>((event, emit) {
      emit(ResultMaps(
          currentPosition: event.currentPosition,
          officePosition: event.officePosition));
    });
  }
}
