import 'package:classifyme/bootstrap.dart';
import 'package:classifyme/classifyme/classifyme.dart';
import 'package:classifyme/utils/_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ClassifyMeConfig(
    values: ClassifyMeValues(
      baseDomain: 'http://127.0.0.1:8000',
    ),
  );

  bootstrap(
    () => MultiBlocProvider(
      providers: Singletons.registerCubits(),
      child: ClassifyMe(),
    ),
  );
}
