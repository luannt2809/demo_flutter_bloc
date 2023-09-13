import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_flutter_bloc/call_api/api_respository.dart';
import 'package:demo_flutter_bloc/call_api/model/task.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    final ApiRespository _apiRes = ApiRespository();

    on<TaskEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(TaskLoading());
        final mList = await _apiRes.fetchTaskList();
        emit(TaskLoaded(mList));
        if (mList.error != null) {
          emit(TaskError(mList.error));
        }
      } on NetworkError {
        emit(TaskError("Network error"));
      }
    });
  }
}
