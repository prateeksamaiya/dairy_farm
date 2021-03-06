import 'package:dairy_farm/components/my_drop_down.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_localizations.dart';
import '../provider.dart';
import '../translation_constants.dart';

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


  @override
  Widget build(BuildContext context) {
    print("building MilkingScreen");
    MilkingEntry milkingEntry = useProvider(milkEntryProvider).state;
    bool isCattleNumberEmpty = useProvider(isCattleNumberEmptyProvider).state;
    bool isMilkQuantityEmpty = useProvider(isMilkQuantityEmptyProvider).state;
    if (isUpdatingEntry) {
      milkQuantityController..text = milkingEntry.milkQuantity == null ? "" : milkingEntry.milkQuantity.toString();
      cattleNumberController..text = milkingEntry.cattleNumber == null ? "" : milkingEntry.cattleNumber.toString();
      milkQuantityController.selection =
          TextSelection.fromPosition(
              TextPosition(offset: milkingEntry.milkQuantity == null ? 0 : milkingEntry.milkQuantity
                  .toString()
                  .length));
      cattleNumberController.selection =
          TextSelection.fromPosition(
              TextPosition(offset: milkingEntry.cattleNumber == null ? 0 : milkingEntry.cattleNumber
                  .toString()
                  .length));
    }
    bool isButtonPressed = useProvider(buttonPressed).state;

    final milkQuantityValidator = FilteringTextInputFormatter(RegExp("^([1-9][0-9]{0,4})"), allow: true);
    final cattleNumberValidator = FilteringTextInputFormatter(RegExp("^([0-9]{0,3})"), allow: true);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
      child: ProviderListener(
        provider: clientStatus,
        onChange: (BuildContext context,
            StateController<AsyncValue<String>> statusMessage,) {
          statusMessage.state.when(
              data: (String message) =>
              {
                context
                    .read(buttonPressed)
                    .state = false,
                milkQuantityController.clear(),
                cattleNumberController.clear(),
                ApplicationUtil.showSnackbar(context, Text(message))
              },
              loading: () =>
              context
                  .read(buttonPressed)
                  .state = true,
              error: (Object error, StackTrace stackTrace) =>
              {context
                  .read(buttonPressed)
                  .state = false, ApplicationUtil.showSnackbar(context, Text(error.toString()))});
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
                    {context
                        .read(milkEntryProvider)
                        .state = milkingEntry.copyWith(milker: milkerName)}),
                MyDropDownButton(
                    value: milkingEntry.cattleType,
                    items: CattleType.values.map((e) => e.toShortString()).toList(),
                    itemIcon: Icon(Icons.ac_unit),
                    onChanged: (cattleType) =>
                    {context
                        .read(milkEntryProvider)
                        .state = milkingEntry.copyWith(cattleType: cattleType)}),
                TextField(
                  inputFormatters: [cattleNumberValidator],
                  controller: cattleNumberController,
                  onChanged: (cattleNumber) {
                    if (cattleNumber.isNotEmpty) context
                        .read(isCattleNumberEmptyProvider)
                        .state = false;
                    context
                        .read(milkEntryProvider)
                        .state =
                        milkingEntry.copyWith(cattleNumber: cattleNumber == "" ? null : int.parse(cattleNumber));
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: ApplicationUtil.translate(enterCattleNumber),
                      errorText: isCattleNumberEmpty ? ApplicationUtil.translate(cattleNumberEmptyMessage) : null),
                ),
                TextField(
                  inputFormatters: [milkQuantityValidator],
                  decoration: InputDecoration(
                      hintText: ApplicationUtil.translate(enterMilkQuantityNumber),
                      errorText: isMilkQuantityEmpty ? ApplicationUtil.translate(milkQuantityEmptyMessage) : null),
                  controller: milkQuantityController,
                  onChanged: (milkQuantity) {
                    if (milkQuantity.isNotEmpty) context
                        .read(isMilkQuantityEmptyProvider)
                        .state = false;
                    context
                        .read(milkEntryProvider)
                        .state =
                        milkingEntry.copyWith(milkQuantity: milkQuantity == "" ? null : int.parse(milkQuantity));
                  },
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                    onPressed: isButtonPressed
                        ? null
                        : () {
                      if (milkingEntry.cattleNumber == null) {
                        context
                            .read(isCattleNumberEmptyProvider)
                            .state = true;
                        return;
                      }
                      if (milkingEntry.milkQuantity == null) {
                        context
                            .read(isMilkQuantityEmptyProvider)
                            .state = true;
                        return;
                      }

                      if (!isUpdatingEntry) {
                        context.read(milkingDataProvider).add(milkingEntry).then((success) => {
                          success?context.read(milkEntryProvider).state = MilkingEntry():null
                    });

                      } else {
                      Navigator.pop(context);
                      context.read(milkingDataProvider).update(milkingEntry).then((success)=>{
                        success?context.read(milkEntryProvider).state = MilkingEntry():null
                      });
                      }
                    },
                    child: isButtonPressed
                        ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
                        : isUpdatingEntry
                        ? Text(ApplicationUtil.translate("Update"))
                        : Text(ApplicationUtil.translate("submit")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
