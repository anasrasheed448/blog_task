import 'dart:convert';

import 'package:blog_task/models/local.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LocalDataController extends ChangeNotifier {
  Data? data;
  getData() async {
    final res = await rootBundle.loadString('lib/api/local.json');
    data = dataFromJson(res);
    return data;
  }
}
