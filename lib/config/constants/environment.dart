
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String moviedbBase = dotenv.env['THE_MOVIEDB_BASEURL'] ?? 'no hay api base';
  static String moviedbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'no hay api key';
  static String moviedbLanguage = dotenv.env['THE_MOVIEDB_LANGUAGE'] ?? 'no hay api language';
  
}