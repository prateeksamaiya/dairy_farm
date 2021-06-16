import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/models/cattle.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../provider.dart';
import 'applicaition_util.dart';

class CattleDataClient {
  final Reader read;

  CattleDataClient(this.read);



  Future<List<CattleEntry>> populateFromServer([DateTime from ,DateTime to]) async {
    String path = "/cattle/fetch/all";
    List<CattleEntry> _cattleData = [];
      var response =
          await http.get(Uri.http(kBackEndUrl, path), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      );

      if (response.statusCode == 200) {
        for (Map<String, dynamic> entry in json.decode(response.body)) {
          _cattleData.add(CattleEntry.fromJson(entry));
        }
        print(_cattleData.length);
      }
      return _cattleData;
  }

  Future<http.Response> submitCattleEntry(CattleEntry CattleEntry) async {
      var response = await http.post(
        Uri.http(kBackEndUrl, "/cattle/insert"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(CattleEntry.toJson()),
      );
      return response;
  }

  Future<http.Response> updateCattleEntry(CattleEntry CattleEntry) async {
      var response = await http.post(
        Uri.http(kBackEndUrl, "/cattle/update/entry"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(CattleEntry.toJson()),
      );
     return response;
  }

  Future<http.Response> deleteEntry(CattleEntry CattleEntry) async {
    print(CattleEntry.dataBaseId.entries.first.value);
    var response = await http.get(
      Uri.http(kBackEndUrl, "/cattle/delete/entry/"+CattleEntry.dataBaseId.entries.first.value),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    return response;
  }


}
