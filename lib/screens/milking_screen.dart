import 'package:dairy_farm/application/notifier/milking_data.dart';
import 'package:dairy_farm/components/milking_form.dart';
import 'package:dairy_farm/components/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MilkingScreen extends HookWidget {
  static const String id = "milking";
  final milkingDataProvider = StateNotifierProvider((ref) => MilkingDataNotifier(ref.read));

  @override
  Widget build(BuildContext context) {
    print("building MilkingScreen");
    return MyScaffold(MilkingForm());
  }
}
