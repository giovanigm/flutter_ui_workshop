import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/core/app_bloc_observer.dart';

import 'app/app.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
