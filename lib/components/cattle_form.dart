import 'package:dairy_farm/enums/cattle_gender.dart';
import 'package:dairy_farm/enums/cattle_status.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/cattle.dart';
import 'package:dairy_farm/models/cattle_status.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/material.dart';

class CattleForm extends StatefulWidget {
  CattleEntry cattleEntry;

  @override
  _CattleFormState createState() => _CattleFormState();

  CattleForm({this.cattleEntry});
}

// Define a corresponding State class.
// This class holds data related to the form.
class _CattleFormState extends State<CattleForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final tagNumberController = TextEditingController();
  final sellerDairyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
//     Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text(ApplicationUtil.translate("Add Cattle")),
        ),
        body: buildForm(context));
  }

  Widget buildForm(BuildContext context) {
    tagNumberController..text = widget.cattleEntry.tagNumber ?? "";
    sellerDairyController..text = widget.cattleEntry.sellerDairy ?? "";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: tagNumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ApplicationUtil.translate("Cattle Tag Number"),
                    hintText: ApplicationUtil.translate("Enter Cattle Number")),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    widget.cattleEntry = widget.cattleEntry.copyWith(tagNumber: value);
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              InputDecorator(
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    labelText: ApplicationUtil.translate("Enter Cattle Type"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.cattleEntry.type != null
                        ? widget.cattleEntry.type.toShortString()
                        : CattleType.Buffalo.toShortString(),
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        widget.cattleEntry = widget.cattleEntry
                            .copyWith(type: CattleType.values.firstWhere((e) => e.toShortString() == newValue));
                      });
                    },
                    items: CattleType.values.map((e) => e.toShortString()).toList().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InputDecorator(
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    labelText: ApplicationUtil.translate("Enter Cattle Genter"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.cattleEntry.gender != null
                        ? widget.cattleEntry.gender.toShortString()
                        : CattleGender.Female.toShortString(),
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        widget.cattleEntry = widget.cattleEntry
                            .copyWith(gender: CattleGender.values.firstWhere((e) => e.toShortString() == newValue));
                      });
                    },
                    items: CattleGender.values.map((e) => e.toShortString()).toList().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InputDecorator(
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    labelText: ApplicationUtil.translate("Enter Cattle Status"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.cattleEntry.currentStatus != null
                        ? widget.cattleEntry.currentStatus.status.toShortString()
                        : CattleStatusEnum.Lactating.toShortString(),
                    isDense: true,
                    onChanged: (String newValue) {
                      widget.cattleEntry = widget.cattleEntry.copyWith(
                          currentStatus: CattleStatus(
                              CattleStatusEnum.values.firstWhere((e) => e.toShortString() == newValue),
                              DateTime.now()));

                      setState(() {
                        widget.cattleEntry = CattleEntry.updateCattleHistory(widget.cattleEntry);
                      });
                    },
                    items: CattleStatusEnum.values.map((e) => e.toShortString()).toList().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: sellerDairyController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ApplicationUtil.translate("Seller Dairy Farm"),
                    hintText: ApplicationUtil.translate("Enter Name Of Seller Dairy Farm")),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    widget.cattleEntry = widget.cattleEntry.copyWith(sellerDairy: value);
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
