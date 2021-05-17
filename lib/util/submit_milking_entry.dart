import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubmitmilkingEntryClient {
  Future<List<MilkingEntry>> populateFromServer() async {
    String path = "/fetch/record/milking/today";
    List<MilkingEntry> _milkingData = [];
    try {
      var response =
          await http.get(Uri.http(kBackEndUrl, path), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        for (Map<String, dynamic> entry in json.decode(response.body))
          _milkingData.add(MilkingEntry.fromJson(entry));
      }
      print(_milkingData.length);
    } catch (e) {
      print(e);
    } finally {
      return _milkingData;
    }
  }
}
