
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/data/models/response_model.dart';
import 'package:math_solver/app/data/services/get_it_service.dart';
import 'package:math_solver/app/data/services/hive_service.dart';

final class Functions
{
  Future setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ResponseModelAdapter());
  final hiveService = HiveService();
  await hiveService.init();
  await registerServices();
}

  void precache(BuildContext context) {
      for (String path in AssetsPath.precacheList) {
        precacheImage(AssetImage(path), context);
      }
    }
  }