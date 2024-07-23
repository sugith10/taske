import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/observer/bloc_observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
