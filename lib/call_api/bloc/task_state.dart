part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final CongViec congViec;

  TaskLoaded(this.congViec);
}

class TaskError extends TaskState {
  final String? message;

  TaskError(this.message);
}
