import 'package:flutter_mmv_with_getx/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? errorMessage;

  ApiResponse(this.status, this.data, this.errorMessage);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.errorMessage) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $errorMessage \n Data : $data";
  }
}
