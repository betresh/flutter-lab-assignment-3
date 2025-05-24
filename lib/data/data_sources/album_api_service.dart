import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/album.dart';

class AlbumApiService {
  final http.Client client;

  AlbumApiService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Album>> fetchAlbums() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
