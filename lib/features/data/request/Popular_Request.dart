import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:Popular/features/domain/model/PopularImage.dart';
import 'package:Popular/features/domain/model/PopularModel.dart';
import 'package:Popular/features/domain/model/Popularinfo.dart';

class PopularRequest {
  static void getPopular({
    required Function(List<Results>? ) onsucsess,
    required Function(int statuscode) onerror,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b"),
        headers: headers).then((value){
          if(value.statusCode==200){
            Map<String ,dynamic> decoded={};
            decoded=json.decode(value.body);
            PopularModel popularModel=PopularModel.fromJson(decoded);
            onsucsess( popularModel.results);
          }
          else{
            onerror(value.statusCode);
          }
          log(value.body,name: "this is my value ");
          log(value.statusCode.toString(),name: "this is my status");

    });

  }
  static void getinfo({
    required int id,
    required Function(Popularinfo) onsucsess,
    required Function(int statuscode) onerror,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"),
        headers: headers).then((value){
      if(value.statusCode==200){
        Map<String ,dynamic> decoded={};
        decoded=json.decode(value.body);
        Popularinfo popularinfo=Popularinfo.fromJson(decoded);

        onsucsess( popularinfo);
      }
      else{
        onerror(value.statusCode);
      }
      log(value.body,name: "this is my value ");
      log(value.statusCode.toString(),name: "this is my status");

    });

  }
  static void getImage({
    required int id,
    required Function(PopularImage) onsucsess,
    required Function(int statuscode) onerror,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
        headers: headers).then((value){
      if(value.statusCode==200){
        Map<String ,dynamic> decoded={};
        decoded=json.decode(value.body);
PopularImage popularImage=PopularImage.fromJson(decoded);
        onsucsess( popularImage);
      }
      else{
        onerror(value.statusCode);
      }
      log(value.body,name: "this is my value ");
      log(value.statusCode.toString(),name: "this is my status");

    });

  }
}
