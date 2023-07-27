import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Fileprovider extends ChangeNotifier {
  var dio = Dio();
  var tempdir;
  bool? _isloading;
  String? _url;
  String? _error;

  bool? get isloading => _isloading;
  String? get url => _url;
  String? get error => _error;

  set seturl(String udata) {
    _url = udata;
    notifyListeners();
  }

  set setloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  setisloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  clean() {
    _isloading = false;
    _url = null;
    _error = null;
    notifyListeners();
  }

  getTempDir() async {
    var tempdir = await getApplicationDocumentsDirectory();
    notifyListeners();
  }

  downloadFile() async {
    final direct = await getExternalStorageDirectory();
    getTempDir();
    setisloading(true);
    notifyListeners();
    try {
      if (_url == null) {
        _error = "url is null";
        notifyListeners();
        throw Exception("url is null");
      }
      Directory("${direct!.path}/").create(recursive: true);
      final responce = await dio.download(
        _url.toString(),
        "${direct.path}/file.pdf",
        onReceiveProgress: (count, total) {
          if (kDebugMode) {
            print("${(count / total * 100).toStringAsFixed(0)}%");
            print("${direct.path}/file.pdf");
            print(Exception());
          }
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      File file = await File("file.pdf").create(recursive: true);
      var ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(responce.data);
      await ref.close();
      if (responce.statusCode == 200) {
        setisloading(false);
        notifyListeners();
      } else {
        _error = "error in downloading";
        notifyListeners();
        setisloading(false);
        notifyListeners();
      }
    } catch (e) {
      setisloading(false);
      _error = e.toString();
      notifyListeners();
    }
  }
}
