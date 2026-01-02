import 'package:afectod/app/common/get_it/get_it.dart';
import 'package:afectod/app/features/data/services/auth_service.dart';
import 'package:afectod/hive_registrar.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final class AfectodFunctions {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapters();
    setupGetIt();
    await getIt<AuthService>().init();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
