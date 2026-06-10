import 'package:ali/core/di/dependency_injection.dart';
import 'package:ali/core/routing/app_router.dart' show AppRouter;
import 'package:ali/doc_app.dart' show DocApp;
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
