import 'package:flutter/foundation.dart';
import 'package:flutter_app/base_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<BaseResponse> getData() async {
    var result = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (result.statusCode == 200) {
      if (kDebugMode) {
        print(result.body);
      }
      throw Exception('zzzzzzzzzzzzzzzzzzzzff');
      var res = BaseResponse.success(result.body);
      return res;
    } else {
      return BaseResponse.fail(result.statusCode.toString());
    }
  }
}
