import 'package:dairy_farm/application_constants.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../provider.dart';

class MilkingDataClient {
  final Reader read;

  MilkingDataClient(this.read);

  Future<List<MilkingEntry>> populateFromServer() async {
    String path = "/fetch/record/milking/today";
    List<MilkingEntry> _milkingData = [];
      var response =
          await http.get(Uri.http(kBackEndUrl, path), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        for (Map<String, dynamic> entry in json.decode(response.body)) {
          _milkingData.add(MilkingEntry.fromJson(entry));
        }
        print(_milkingData.length);
      }
      return _milkingData;
  }

  void submitMilkingEntry(MilkingEntry milkingEntry) async {
    read(clientStatus).state = AsyncLoading();
    try {
      var response = await http.post(
        Uri.http(kBackEndUrl, "/milking/update"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(milkingEntry.toJson()),
      );
      if (response.statusCode == 200) {
        read(clientStatus).state =
            AsyncData("Milking details successfully updated");
      } else
        read(clientStatus).state =
            AsyncError("Error while updating milking details");
    } catch (e) {
      read(clientStatus).state =
          AsyncError("Exception occured while submitting data");
    }
  }
}
