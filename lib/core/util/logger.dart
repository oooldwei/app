import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printTime: true,
    // noBoxingByDefault: true,
  ),
);
