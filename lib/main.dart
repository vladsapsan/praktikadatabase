
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'core/data_base_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.init();
  runApp(Container());
}
