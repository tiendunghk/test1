import 'package:flutter/foundation.dart';
import 'package:flutter_app/api_service.dart';
import 'package:flutter_app/base_provider.dart';
import 'package:flutter_app/base_response.dart';

class TestProvider extends BaseProvider {

  BaseResponse? _response;

  BaseResponse? get response => _response;

  Future<BaseResponse> getData() async {
    late BaseResponse baseResponse;
    try {
      setStatus(Status.LOADING);
      Future.delayed(const Duration(microseconds: 800));
      baseResponse = await ApiService().getData();
    } catch(e) {
      setErrorMessage(e.toString());
    }
    finally {
      setStatus(Status.DONE);
      _response = baseResponse;
      return baseResponse;
    }
  }
}
