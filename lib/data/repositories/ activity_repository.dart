import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activity_model.dart';

class ActivityRepository {
  final String apiUrl = 'http://your-spring-api-url/activities'; // Remplace par l'URL de ton API

  Future<void> saveActivity(Activity activity) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(activity.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save activity');
    }
  }

  Future<List<Activity>> getActivities() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Activity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load activities');
    }
  }
}