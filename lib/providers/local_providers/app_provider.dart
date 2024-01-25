import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/global_variables.dart';
class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:providers,
        builder:(context,provider)=>child
    );
  }
}