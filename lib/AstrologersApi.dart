import 'dart:convert';
import 'package:astro_tak/Models/PostModels.dart';
import 'package:http/http.dart' as http;

class AstrologersApi {
  static Future<List<PostModelData>> getBooks(String query) async {
    final url = Uri.parse('https://www.astrotak.com/astroapi/api/agent/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List res = json.decode(response.body);

      return res.map((json) => PostModelData.fromJson(json)).where((index) {
        final titleLower = index.firstName.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
