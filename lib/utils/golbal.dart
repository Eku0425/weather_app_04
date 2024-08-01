import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String _globalVariable = 'Surat';

  String get globalVariable => _globalVariable;

  set globalVariable(String value) {
    _globalVariable = value;
    notifyListeners();
  }

  static MyProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<MyProvider>(context, listen: listen);
  }

  List IconsList = [
    {'icon': Icons.favorite_border_rounded, 'name': 'Favorites'},
    {'icon': Icons.notification_add_rounded, 'name': 'Notification'},
    {'icon': Icons.payment_rounded, 'name': 'Payments'},
    {'icon': Icons.settings, 'name': 'Settings'},
  ];

  var SearchText = TextEditingController();
}
