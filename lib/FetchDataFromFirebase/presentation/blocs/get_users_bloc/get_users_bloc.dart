import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../domain/use_cases/get_users_usecase.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final GetUsersUseCase getUssersUseCase;
  GetUsersBloc({required this.getUssersUseCase}) : super(GetUsersInitial()) {
    on<GetUsersEvent>((event, emit)=>handleGetUsersEvent(emit,event));
  }

  handleGetUsersEvent(Emitter<GetUsersState> emit, GetUsersEvent event) async{
    emit(GetUsersLoading());
    try{
      var result=await getUssersUseCase.call();
      emit(GetUsersSuccess(getDataReference:  result));
    }
    catch(e){
      print(e);
      emit(GetUsersFailed());
    }
  }
}
