import 'dart:convert';
import 'dart:io';

import 'package:blog_task/constants/constant.dart';
import 'package:blog_task/models/drink.dart';
import 'package:blog_task/widgets/Form.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DrinkController extends ChangeNotifier {
  DrinkModel? drinks;
  Rx<List<Drinks>> list = Rx([]);
  getData() async {
    final pref = await SharedPreferences.getInstance();
    try {
      final res = await http
          .get(Uri.parse(drinkAPI))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        if (pref.containsKey('drinks')) {
          customSnackBar('Internet Error. Data detched from local storage');
          return http.Response(pref.getString('drinks') ?? "{}", 200);
        }
        return Future.error('error');
      });
      // print('rea');
      pref.setString('drinks', res.body);
      drinks = DrinkModel.fromJson(jsonDecode(res.body));
      list.value = drinks!.drinks;
      // print(drinks);
      return true;
    } on SocketException catch (_) {
      if (pref.containsKey('drinks')) {
        customSnackBar('Internet Error. Data detched from local storage');
        drinks =
            DrinkModel.fromJson(jsonDecode(pref.getString('drinks') ?? '{}'));
        list.value = drinks!.drinks;

        return true;
      }
    } catch (e) {
      // print(e/)/;
    }
  }

  void search(String text) {
    List<Drinks> res = [];
    if (list.value.isEmpty) {
      res = drinks!.drinks;
    } else {
      res = drinks!.drinks
          .where((element) =>
              element.strDrink!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    list.value = res;
  }
}
