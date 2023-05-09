import 'package:classifyme/bootstrap.dart';
import 'package:classifyme/classifyme/classifyme.dart';
import 'package:classifyme/firebase_options.dart';
import 'package:classifyme/utils/_index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ClassifyMeConfig(
    values: ClassifyMeValues(
      baseDomain: 'http://127.0.0.1:8000',
    ),
  );

  bootstrap(
    () => MultiProvider(
      providers: Singletons.registerNotifiers(),
      child: MultiBlocProvider(
        providers: Singletons.registerCubits(),
        child: ClassifyMe(),
      ),
    ),
  );
}
