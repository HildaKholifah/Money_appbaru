import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl = "http://172.16.0.2:8000/api/";
  //diganti 10.0.2.2 (api emulator),
  // kalo menggunakan device asli ganti ke ip komputer lokal dan memakai wifi yang sama
  // gunakan IPv4 Address: (cara cek nya ipconfig)

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );
    //log(response.body);
    return response;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl $endpoint');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    return response;
  }
}
