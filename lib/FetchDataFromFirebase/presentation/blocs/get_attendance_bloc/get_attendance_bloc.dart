import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_attendance_event.dart';
part 'get_attendance_state.dart';

class GetAttendanceBloc extends Bloc<GetAttendanceEvent, GetAttendanceState> {
  GetAttendanceBloc() : super(GetAttendanceInitial()) {
    on<GetAttendanceEvent>((event, emit) => handleGetAttendanceEvent(event,emit));
  }

  handleGetAttendanceEvent(GetAttendanceEvent event, Emitter<GetAttendanceState> emit) {

  }
}
