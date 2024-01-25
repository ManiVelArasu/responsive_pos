import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:responsive_design/providers/local_providers/app_provider.dart';
import 'package:responsive_design/providers/local_providers/local_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/global_variables.dart';
import 'Utils/routes.dart';
import 'Utils/style.dart';
import 'data_services/api_helper.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBottomColor, // navigation bar color
    statusBarColor: primaryColor,
    statusBarIconBrightness: Brightness.light,// status bar color
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((value) => MyApp());
  Get.lazyPut(
        () => ApiHelper(),
  );
  Get.lazyPut(
        () async => await SharedPreferences.getInstance(),
  );
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 100,
              ),
              Text(
                kReleaseMode
                    ? 'Oops... something went wrong'
                    : errorDetails.exception.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  };

  runApp(
    const AppProviders(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override

  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    callSetFun();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {

    LocalJsonLocalization.delegate.directories = ['lib/utils/i18n/'];
    return Consumer<LocaleProvider>(
      builder: (context, provider, snapshot) {
        Get.lazyPut<LocaleProvider>(() => provider);
        return Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
          },
          child: MyMaterialApp(context, provider, snapshot),
        );
      },
    );
  }

  void callSetFun() async {
    context.read<LocaleProvider>().init();
  }
}

class MyMaterialApp extends StatelessWidget {
  final LocaleProvider provider;
  final BuildContext context;
  final Widget? snapshot;

  const MyMaterialApp(this.context, this.provider, this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: primaryColor,
        ),
        useMaterial3: true,

      ),
      supportedLocales: supportedLocalesList,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      locale: provider.locale,
      initialRoute: AppRoutes.homeScreen.name,
      routes: routes,
    );
  }
}
