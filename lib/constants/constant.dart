import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

convertDate(d) {
    var outputFormat = DateFormat("dd MMMM yyyy");
    return outputFormat.format(d);
    
}

Map<String, IconData> tabbarItems = {
  'Home': Icons.home,
  'Medicine': Icons.mediation,
  'Profile': Icons.person,
};
String drinkAPI = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar';
String userInfoAPI='https://randomuser.me/api/';