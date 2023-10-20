import 'package:shoppers_bay/data/response/status.dart';

//generic class , it can with different data types
class ApiResponse<T> {
  Status? status; //from enum class
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loading()
      : status = Status
            .LOADING; //This line is a named constructor called loading(). It creates an instance of ApiResponse with the status set to Status.LOADING
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
