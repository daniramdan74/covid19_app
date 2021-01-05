import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static _setHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      static final String _url = 'https://data.covid19.go.id/public/api/';

getDataUpdate(apiUrl) async {
    var fullUrl = _url + apiUrl;
     print(fullUrl);
    return await http.get(fullUrl, headers: _setHeaders());
  }

  getDataProvince(apiUrl) async {
    var fullUrl = _url + apiUrl+'.json';
     print(fullUrl);
    return await http.get(fullUrl, headers: _setHeaders());
  }
}