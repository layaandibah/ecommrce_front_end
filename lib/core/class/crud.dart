import 'dart:convert';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/checkinternet.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {

     if (await checkInternet()) {
       var response = await http.post(Uri.parse(url), body: data);
       if (response.statusCode == 200 || response.statusCode == 201) {
         print(response.statusCode);
         print(response.body) ;
         var responsebody = jsonDecode(response.body);
         print("=======DataResponse========");
         print(responsebody) ;
         return Right(responsebody);
       } else {
         print("=======failstatusCode========");
         return Left(StatusRequest.serverfailure);
       }
     } else {
       print("=======internet========");

       return const Left(StatusRequest.offlinefailure);
     }

  }
}
