import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:provider1/model.dart';

class Providerset extends ChangeNotifier {
  bool? _isloading;
  String? _url;
  bool? get isloading => _isloading;
  String? get url => _url;

  void setloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  getapicall() async {
    setloading(true);
    notifyListeners();
    if (kDebugMode) {
      print("api call $_isloading");
    }
    final responce =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    if (kDebugMode) {
      print("api call");
      print(responce.body);
    }
    if (responce.statusCode == 200) {
      _url = petsFromJson(responce.body).message;
      setloading(false);
      notifyListeners();
    } else {
      setloading(false);
      notifyListeners();
      if (kDebugMode) {
        print("api call $_isloading");
      }
    }
  }
}
