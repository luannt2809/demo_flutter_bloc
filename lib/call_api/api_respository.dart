import 'package:demo_flutter_bloc/call_api/api_provider.dart';
import 'package:demo_flutter_bloc/call_api/model/task.dart';

class ApiRespository {
  final _provider = ApiProvider();

  Future<CongViec> fetchTaskList() {
    return _provider.fetchData();
  }
}

class NetworkError extends Error {}