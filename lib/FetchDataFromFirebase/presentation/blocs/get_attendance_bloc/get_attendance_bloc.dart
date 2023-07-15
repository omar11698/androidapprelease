import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/get_attendance_usecase.dart';

part 'get_attendance_event.dart';
part 'get_attendance_state.dart';

class GetAttendanceBloc extends Bloc<GetAttendanceEvent, GetAttendanceState> {
  final GetAttendanceUseCase getAttendanceUseCase;
  GetAttendanceBloc({required this.getAttendanceUseCase}) : super(GetAttendanceInitial()) {
    on<GetAttendanceEvent>((event, emit) => handleGetAttendanceEvent(event,emit));

    on<GettingAttendanceEvent>((event, emit) => handleGetAttendanceEvent(event,emit));



  }

  handleGetAttendanceEvent(GetAttendanceEvent event, Emitter<GetAttendanceState> emit)async {
    emit(GetAttendanceLoadingState());
    try{
      var result=await getAttendanceUseCase.call();
      emit(GetAttendanceSuccess(databaseReference:result));
    }
   catch(e){
      print(e);
      emit(GetAttendanceFailed());
   }

  }
}
