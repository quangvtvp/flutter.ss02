import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'gemini_model.dart';

/// Fetches a fresh batch of words for each game run using the Gemini API.
class WordPromptService {
  WordPromptService({
    String? apiKey,
    GeminiModel model = GeminiModel.gemini25FlashLite,
  }) : _apiKey = apiKey?.trim(),
       _model = model,
       _generativeModel = _buildModel(apiKey?.trim(), model);

  String? _apiKey;
  GeminiModel _model;
  GenerativeModel? _generativeModel;

  GeminiModel get model => _model;
  bool get hasValidApiKey => _generativeModel != null;

  void updateApiKey(String? apiKey) {
    final normalized = apiKey?.trim();
    if (_apiKey == normalized) {
      return;
    }
    _apiKey = normalized;
    _generativeModel = _buildModel(_apiKey, _model);
  }

  void selectModel(GeminiModel model) {
    if (_model == model) {
      return;
    }
    _model = model;
    _generativeModel = _buildModel(_apiKey, _model);
  }

  static GenerativeModel? _buildModel(String? apiKey, GeminiModel model) {
    if (apiKey == null || apiKey.isEmpty) {
      return null;
    }
    return GenerativeModel(model: model.id, apiKey: apiKey);
  }

  Future<List<String>> fetchWordList({int count = 50}) async {
    final generativeModel = _generativeModel;
    if (generativeModel == null) {
      debugPrint('Gemini API key missing; using fallback word list.');
      return const [];
    }

    try {
      final response = await generativeModel.generateContent([
        Content.text(
          'Generate a JSON array containing exactly $count unique Vietnamese '
          'phrases suitable for a family-friendly word guessing game. '
          'Each string must include at least two words separated by a single '
          'space, be no longer than 16 characters, and avoid special symbols '
          'or punctuation beyond spaces. Respond with JSON only and no '
          'explanations.',
        ),
      ]);

      final text = response.text;
      if (text == null || text.trim().isEmpty) {
        debugPrint('Gemini response did not include text content.');
        return const [];
      }

      final payload = _extractJsonPayload(text);
      final decoded = jsonDecode(payload);
      if (decoded is! List) {
        debugPrint('Gemini response payload is not a JSON array.');
        return const [];
      }

      return decoded
          .whereType<String>()
          .map((word) => word.trim())
          .where((word) => word.isNotEmpty)
          .toList(growable: false);
    } on GenerativeAIException catch (error) {
      debugPrint('Gemini API error: ${error.message}');
      return const [];
    } on FormatException catch (error) {
      debugPrint('Gemini response was not valid JSON: $error');
      return const [];
    } catch (error) {
      debugPrint('Unexpected error while fetching words from Gemini: $error');
      return const [];
    }
  }

  String _extractJsonPayload(String responseText) {
    final fenced = RegExp(
      r'```(?:json)?\s*([\s\S]*?)\s*```',
    ).firstMatch(responseText);
    if (fenced != null && fenced.groupCount >= 1) {
      final match = fenced.group(1);
      if (match != null && match.trim().isNotEmpty) {
        return match;
      }
    }

    final bracketed = RegExp(r'\[[\s\S]*\]').firstMatch(responseText);
    if (bracketed != null) {
      final match = bracketed.group(0);
      if (match != null && match.trim().isNotEmpty) {
        return match;
      }
    }

    return responseText;
  }
}
