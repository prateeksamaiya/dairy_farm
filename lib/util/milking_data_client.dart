import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../provider.dart';
import 'applicaition_util.dart';

class MilkingDataClient {
  final Reader read;

  MilkingDataClient(this.read);



  Future<List<MilkingEntry>> populateFromServer([DateTime from ,DateTime to]) async {
    String path = "/milking/fetch/record/today";
    var queryParameters = {
      'from':from!=null?from.toUtc().toIso8601String():ApplicationUtil.midnight().toUtc().toIso8601String(),
      'to': to!=null?to.toUtc().toIso8601String():ApplicationUtil.midnight().add(Duration(days: 1)).toUtc().toIso8601String(),
    };
    List<MilkingEntry> _milkingData = [];
      var response =
          await http.get(Uri.http(kBackEndUrl, path,queryParameters), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      );

      if (response.statusCode == 200) {
        for (Map<String, dynamic> entry in json.decode(response.body)) {
          _milkingData.add(MilkingEntry.fromJson(entry));
        }
        print(_milkingData.length);
      }
      return _milkingData;
  }

  Future<http.Response> submitMilkingEntry(MilkingEntry milkingEntry) async {
      var response = await http.post(
        Uri.http(kBackEndUrl, "/milking/insert"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(milkingEntry.toJson()),
      );
      return response;
  }

  Future<http.Response> updateMilkingEntry(MilkingEntry milkingEntry) async {
      var response = await http.post(
        Uri.http(kBackEndUrl, "/milking/update/entry"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(milkingEntry.toJson()),
      );
     return response;
  }

  Future<http.Response> deleteEntry(MilkingEntry milkingEntry) async {
    print(milkingEntry.dataBaseId.entries.first.value);
    var response = await http.get(
      Uri.http(kBackEndUrl, "/milking/delete/entry/"+milkingEntry.dataBaseId.entries.first.value),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    return response;
  }


}
