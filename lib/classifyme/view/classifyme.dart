import 'package:classifyme/features/value_proposition/value_proposition.dart';
import 'package:classifyme/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ClassifyMe extends StatelessWidget {
  const ClassifyMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ValueProposition(),
    );
  }
}
