import 'package:dairy_farm/components/my_drop_down.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider.dart';

class MilkingForm extends HookWidget {
  bool isUpdatingEntry;
  var isCattleNumberEmptyProvider = StateProvider<bool>((ref) => false);
  var isMilkQuantityEmptyProvider = StateProvider<bool>((ref) => false);

  MilkingForm([bool isUpdatingEntry]) {
    this.isUpdatingEntry = isUpdatingEntry ?? false;
  }

  final buttonPressed = StateProvider<bool>((ref) => false);

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
    bool isCattleNumberEmpty = useProvider(isCattleNumberEmptyProvider).state;
    bool isMilkQuantityEmpty = useProvider(isMilkQuantityEmptyProvider).state;
    if (isUpdatingEntry) {
      milkQuantityController..text = milkingEntry.milkQuantity.toString();
      cattleNumberController..text = milkingEntry.cattleNumber.toString();
      milkQuantityController.selection =
          TextSelection.fromPosition(TextPosition(offset: milkingEntry.milkQuantity.toString().length));
      cattleNumberController.selection =
          TextSelection.fromPosition(TextPosition(offset: milkingEntry.cattleNumber.toString().length));
    }
    bool isButtonPressed = useProvider(buttonPressed).state;

    final milkQuantityValidator = FilteringTextInputFormatter(RegExp("^([1-9][0-9]{0,4})"), allow: true);
    final cattleNumberValidator = FilteringTextInputFormatter(RegExp("^([0-9]{0,8})"), allow: true);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
      child: ProviderListener(
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
                  inputFormatters: [cattleNumberValidator],
                  controller: cattleNumberController,
                  onChanged: (cattleNumber) {
                    if (cattleNumber.isNotEmpty) {
                      context.read(isCattleNumberEmptyProvider).state = false;
                      context.read(milkEntryProvider).state =
                          milkingEntry.copyWith(cattleNumber: int.parse(cattleNumber));
                    } else {
                      context.read(milkEntryProvider).state = milkingEntry.copyWith(cattleNumber: null);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter Cattle Number',
                      errorText: isCattleNumberEmpty ? "Cattle number cannot be empty" : null),
                ),
                TextField(
                  inputFormatters: [milkQuantityValidator],
                  decoration: InputDecoration(
                      hintText: 'Enter Milk Quantity Number',
                      errorText: isMilkQuantityEmpty ? "Milk Quantity number cannot be empty" : null),
                  controller: milkQuantityController,
                  onChanged: (milkQuantity) {
                    if (milkQuantity.isNotEmpty) {
                      context.read(isMilkQuantityEmptyProvider).state = false;
                      context.read(milkEntryProvider).state =
                          milkingEntry.copyWith(milkQuantity: int.parse(milkQuantity));
                    } else {
                      context.read(milkEntryProvider).state = milkingEntry.copyWith(milkQuantity: null);
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                    onPressed: isButtonPressed
                        ? null
                        : () {
                            if (milkingEntry.cattleNumber == null) {
                              context.read(isCattleNumberEmptyProvider).state = true;
                            } else if (milkingEntry.milkQuantity == null) {
                              context.read(isMilkQuantityEmptyProvider).state = true;
                            } else if (!isUpdatingEntry) {
                              context.read(milkingDataProvider).add(milkingEntry);
                              context.read(milkEntryProvider).state = MilkingEntry();
                            } else {
                              Navigator.pop(context);
                              context.read(milkingDataProvider).update(milkingEntry);
                              context.read(milkEntryProvider).state = MilkingEntry();
                            }
                          },
                    child: isButtonPressed
                        ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
                        : isUpdatingEntry
                            ? Text("Update")
                            : Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
