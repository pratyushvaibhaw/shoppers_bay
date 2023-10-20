import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoppers_bay/data/network/BaseApiServices.dart';
import 'package:shoppers_bay/data/response/app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  //methods of abstract class must be overridden in subclass or the subsclass should be made abstract too.
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 60));
      responseJson = returnResponse(response);
    } on SocketException {
      //SocketException typically indicates that there was a problem with establishing or managing a network connection.
      throw FetchDataExceptions(' No Internet Connection');
    }
    return responseJson; // returns the parsed json object
  }



// this function return the decode json or throw exception
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responeJson = jsonDecode(response.body);
        return responeJson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 404:
        throw UnauthorisedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error occured while communicating with server' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
