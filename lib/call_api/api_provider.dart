import 'package:dio/dio.dart';
import 'package:demo_flutter_bloc/call_api/model/task.dart';

class ApiProvider {
  final Dio dio = Dio();
  final String _url = "http://192.168.1.39:3000/api/congviec/list";

  Future<CongViec> fetchData() async {
    try {
      Response response = await dio.get(_url);

      return CongViec.fromJson(response.data);
    } catch (err, stackTrace) {
      print("Exception occured: $err stackTrace: $stackTrace");
      return CongViec.withError("Data not found / Connection issue");
    }
  }
}