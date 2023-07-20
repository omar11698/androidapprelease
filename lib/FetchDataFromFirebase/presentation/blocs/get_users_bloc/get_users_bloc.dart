import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/constants/strings.dart';
import '../../../domain/entities/branch_entity.dart';
import '../../../domain/use_cases/get_users_usecase.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final GetUsersUseCase getUsersUseCase;
  GetUsersBloc({required this.getUsersUseCase}) : super(GetUsersInitial()) {




    on<GetUsersEvent>((event, emit)=>handleGetUsersEvent(emit,event));




  }

  handleGetUsersEvent(Emitter<GetUsersState> emit, GetUsersEvent event) async{
    emit(GetUsersLoading());
    late List<Branch> listOfBranchObject;

    try{
      var result=await getUsersUseCase.call();
      List<Branch>listOfBranches=[];

      await result.parent?.parent?.once().then((event){
        if (event.snapshot.value != null) {
          Map<dynamic,dynamic>? data = event.snapshot.value as Map?;
          List?branchesNames=data?.keys.toList();
           for(int i =0; i<branchesNames!.length;i++){
            listOfBranches.add(Branch(name: branchesNames[i].toString(), logo: kStrImages));
          }
          listOfBranchObject=listOfBranches;

        } else {
          print('No data found');
        }
        return null;
      });
      emit(GetUsersSuccess(getDataReference:  result, listOfBranch: listOfBranchObject,));
    }

    catch(e){
      print(e);
      emit(GetUsersFailed());
    }
  }



}

