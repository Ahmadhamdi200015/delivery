import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:delivery/core/funcation/status_request.dart';
import 'package:http/http.dart' as http;

import '../funcation/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest,Map>> dataPost(
      String linkUrl, Map data) async {

      if (await CheckInternet()) {
        final response = await http.post(Uri.parse(linkUrl),body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
         Map responseBody =await jsonDecode(response.body);
        // List<MyDataModel> users =   responseBody.map((e)=>MyDataModel.fromJson(e)).toList();
        print(responseBody);
         return Right(responseBody);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } else {
        return Left(StatusRequest.offlinefailure);

    }
  }
}
