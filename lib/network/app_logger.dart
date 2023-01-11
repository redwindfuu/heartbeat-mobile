import 'package:logger/logger.dart';

class AppLogger {

  static logInfo(String? message, {bool showBox = true}) {
    Logger(printer: PrettyPrinter(methodCount: 0, printEmojis: true, noBoxingByDefault: !showBox, lineLength: 30)).i(message, null, null);
  }

  static logError(
      String? message, [
        dynamic error,
        StackTrace? stackTrace,
      ]) {
    Logger(printer: PrettyPrinter(methodCount: 0, printEmojis: true, lineLength: 30)).e(message, error, stackTrace);
  }

  static final _instance = AppLogger._internal();

  factory AppLogger() {
    return _instance;
  }

  AppLogger._internal();
}