import 'dart:async';

import 'package:quizz_app/core/models/questions_model.dart';
import 'package:http/http.dart' as http;

class QuestionsService {
  Future<QuestionsResponse> getData() async {
    var client = http.Client();
    var uri =
        Uri.parse('https://f1-go-api-production.up.railway.app/questions');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return questionsResponseFromJson(json);
    } else {
      throw Exception('Failed to load');
    }
  }
}
