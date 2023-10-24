import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.development";
  static String get googleApiKey => dotenv.env['GOOGLE_API_KEY'] ?? 'N/A';
}
