// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:math_solver/app/core/constants/string_constants.dart';
import 'package:math_solver/app/data/models/response_model.dart';

class ApiService {
  ApiService();

  Future<ResponseModel?> sendImageRequest(String imagePath) async {
    try {
      var file = File(imagePath);
      var uint8list = await file.readAsBytes();
      final base64Image = _encodeToBase64(uint8list);
      final payload = _constructPayload(base64Image);
      final Map<String,String> headers = _constructHeaders();

      final response = await _sendRequest(payload, headers);
      return _parseResponse(response);
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }


  String _encodeToBase64(List<int> imageBytes) {
    return base64Encode(imageBytes);
  }

  Map _constructPayload(String base64Image) {
    return {
      "model": "gpt-4o",
      "messages": [
        {
          "role": "user",
          "content": [
            "Can you solve this math question in 3 steps and provide the answer in JSON format? Do not change math symbols to words (e.g., keep √ as √, not sqrt). The format should be: {\"QUESTION\": \"The question here as String\", \"SOLUTION\": [\"Solution step 1\", \"Solution step 2\", \"Solution step 3\"], \"RESULT\": \"Final result here as String\"}. Here is the image of the question:",
            {
              "type": "text",
              "text": "Can you solve this math question in 3 steps and provide the answer in JSON format? Do not change math symbols to words (e.g., keep √ as √, not sqrt) and dont use double quotes inside the strings. The format should be: {\"QUESTION\": \"The mathematical expression of the question without explanation as String\", \"SOLUTION\": [\"Solution step 1 without any explanation\", \"Solution step 2 without any explanation\", \"Solution step 3 without any explanation\"], \"RESULT\": \"Final result here as String without any explanation\"}. Here is the image of the question:",
            },
            {
              "type": "image_url",
              "image_url": {"url": "data:image/jpeg;base64,$base64Image"}
            }
          ]
        }
      ],
      "max_tokens": 500
    };
  }

  Map<String, String> _constructHeaders() {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey"
    };
  }

  Future<Response> _sendRequest(Map payload, Map<String, String> headers) {
    return http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: headers,
      body: jsonEncode(payload),
    );
  }

  ResponseModel? _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      try {
        final decodedBody = utf8.decode(response.bodyBytes);

        final decodedResponse = jsonDecode(decodedBody);
        final messageContentRaw =
            decodedResponse['choices'][0]['message']['content'];

        var messageContent = messageContentRaw
            .replaceAll('```json', '')
            .replaceAll('```', '')
            .trim();

        // Replace single quotes with double quotes
        messageContent = messageContent.replaceAll("'", '"');

        if (messageContent is String) {
          final responseData = jsonDecode(messageContent);
          String question = responseData['QUESTION'];
          List<String> solutions = (responseData['SOLUTION'] as List).map((e) => e as String).toList();
          String result = responseData['RESULT'];

          final String key = DateTime.now().toIso8601String();
          return ResponseModel(
            id: key,
            question: question,
            solutionSteps: solutions,
            result: result,
          );
        } else {
          print("Return type is not a string");
          return null;
        }
      } catch (e) {
        print("Failed to parse the data: $e");
        return null;
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }
}
