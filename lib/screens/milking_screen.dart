import 'package:dairy_farm/components/milking_form.dart';
import 'package:dairy_farm/components/my_drop_down.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:dairy_farm/models/milking_entry.dart';
import 'package:flutter/material.dart';
import 'package:dairy_farm/enums/cattle_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../provider.dart';

class MilkingScreen extends HookWidget {

  static const String id = "milking";
  @override
  Widget build(BuildContext context){
    print("building MilkingScreen");
    return MyScaffold(MilkingForm());
  }
}


