import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'application/milking_data.dart';

final milking_data_provider = StateNotifierProvider<MilkingData>((ref)=>
  MilkingData();