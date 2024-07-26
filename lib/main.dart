import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/dependency_injection.dart';
import 'core/observer/bloc_observer.dart';
import 'features/task_user/data/models/task_user_model.dart';
import 'features/tasks/data/models/task_model.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentDirectory =
      await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TaskUserModelAdapter());
  DependencyInjection().setupDependencies();

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
