import 'package:dairy_farm/components/my_drop_down.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../provider.dart';

class MilkingScreen extends HookWidget {
  final milkEntryProvider = StateProvider<MilkingEntry>((ref) => MilkingEntry());

  final buttonPressed = StateProvider<bool>((ref) => false);

  static const String id = "milking";
  final String url = "10.0.2.2:5000";
  final cattleNumberController = TextEditingController();
  final milkQuantityController = TextEditingController();

  void showSnackbar(context, Widget widget) {
    final snackBar = SnackBar(
      content: widget,
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }

  @override
  Widget build(BuildContext context) {
    print("building MilkingScreen");
    MilkingEntry milkingEntry = useProvider(milkEntryProvider).state;
    bool isButtonPressed = useProvider(buttonPressed).state;
    return MyScaffold(ProviderListener(
      provider: clientStatus,
      onChange: (
        BuildContext context,
        StateController<AsyncValue<String>> statusMessage,
      ) {
        statusMessage.state.when(
            data: (String message) => {
                  context.read(buttonPressed).state = false,
                  milkQuantityController.clear(),
                  cattleNumberController.clear(),
                  showSnackbar(context, Text(message))
                },
            loading: () => context.read(buttonPressed).state = true,
            error: (Object error, StackTrace stackTrace) =>
                {context.read(buttonPressed).state = false, showSnackbar(context, Text(error.toString()))});
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyDropDownButton(
                  value: milkingEntry.milker,
                  items: ['Manish Samaiya', 'Nanhe', 'Alim', 'Laxman'],
                  itemIcon: Icon(Icons.person),
                  onChanged: (milkerName) =>
                      {context.read(milkEntryProvider).state = milkingEntry.copyWith(milker: milkerName)}),
              MyDropDownButton(
                  value: milkingEntry.cattleType,
                  items: CattleType.values.map((e) => e.toShortString()).toList(),
                  itemIcon: Icon(Icons.ac_unit),
                  onChanged: (cattleType) =>
                      {context.read(milkEntryProvider).state = milkingEntry.copyWith(cattleType: cattleType)}),
              TextField(
                controller: cattleNumberController,
                onChanged: (cattleNumber) {
                  context.read(milkEntryProvider).state = milkingEntry.copyWith(cattleNumber: int.parse(cattleNumber));
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Cattle Number'),
              ),
              TextField(
                controller: this.milkQuantityController,
                onChanged: (milkQuantity) {
                  context.read(milkEntryProvider).state =
                      milkingEntry.copyWith(milkQuantity: double.parse(milkQuantity));
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Milk Quantity'),
              ),
              ElevatedButton(
                  onPressed: isButtonPressed
                      ? null
                      : () {
                          context.read(serverClient).submitMilkingEntry(milkingEntry);
                          context.read(milkingDataProvider).add(milkingEntry);
                        },
                  child: isButtonPressed
                      ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
                      : Text("Submit"))
            ],
          ),
        ),
      ),
    ));
  }
}
