import 'package:demo_flutter_bloc/call_api/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final TaskBloc _taskBloc = TaskBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskBloc.add(GetTaskList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Fetch Data Using Flutter Bloc"),
      ),
      body: BlocProvider(
        create: (_) => _taskBloc,
        child: BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is TaskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          // child: BlocBuilder<TaskBloc, TaskState>(
          //   builder: (context, state) {
          //     if(state is TaskInitial){
          //       return Center(child: CircularProgressIndicator(),);
          //     } else if (state is TaskLoading) {
          //       return Center(child: CircularProgressIndicator(),);
          //     } else if (state is TaskLoaded){
          //       return ListView.builder(itemBuilder: itemBuilder, itemCount: state.congViec.,)
          //     }
          //   },
          // ),
        ),
      ),
    );
  }
}
