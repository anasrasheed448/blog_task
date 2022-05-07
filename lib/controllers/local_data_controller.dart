import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class LocalDataController extends ChangeNotifier {
  getData() async {
    final res = await rootBundle.loadString('../api/local.json');
    final data = await jsonDecode(res);
    print(data);
  }
}
