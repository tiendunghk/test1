import 'package:flutter/cupertino.dart';

enum Status {
  LOADING,
  DONE,
  FAIL,
  NONE
}

class BaseProvider extends ChangeNotifier {
  Status __status = Status.NONE;

  Status get status => __status;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  void setStatus(Status statusValue) {
    __status = statusValue;
    notifyListeners();
  }

  void setErrorMessage(String errorMessageValue) {
    _errorMessage = errorMessageValue;
    notifyListeners();
  }
}