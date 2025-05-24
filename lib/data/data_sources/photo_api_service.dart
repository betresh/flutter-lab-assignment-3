import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/photo.dart';

class PhotoApiService {
  final http.Client client;

  PhotoApiService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Photo>> fetchPhotosByAlbumId(int albumId) async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
