import 'package:dairy_farm/components/cattle_form.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:dairy_farm/models/cattle.dart';
import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider.dart';

class CattleScreen extends HookWidget {
  static const String id = "cattle_screen";

  @override
  Widget build(BuildContext context) {
    final milkEntries = useProvider(cattleDataProvider.state);
    print("building consumer homeScreen");
    return MyScaffold(
      milkEntries.when(
          data: (milkingEntries) => buildSafeArea(context, milkingEntries),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Text(e.toString())),
      () => {context.read(cattleDataProvider).reload()},
      [
        CircleAvatar(
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CattleForm(cattleEntry:CattleEntry())));
            },
          ),
        )
      ],
    );
  }

  SafeArea buildSafeArea(BuildContext context, List<CattleEntry> entries) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: entries.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    CattleEntry cattleEntry = entries.elementAt(index);
                    return ListTile(
                      leading: CircleAvatar(radius: 40, child: Text(cattleEntry.tagNumber.toString())),
                      title: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: ApplicationUtil.translate(cattleEntry.type.toShortString()),
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print(cattleEntry.type.toShortString());
                                  }),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
