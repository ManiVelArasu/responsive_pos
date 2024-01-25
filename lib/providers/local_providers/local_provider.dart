//import 'package:connectivity_plus/connectivity_plus.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../../Utils/global_variables.dart';
import '../../repository/local_repository.dart';
import '../my_notifier.dart';
class LocaleProvider extends ChangeNotifier with MyNotifier {
  Locale _locale = supportedLocalesList[0];
  final LocalRepository _localRepository = LocalRepository();

  Locale get locale => _locale;

  //
  // String? _fcmtoken = "";
  //
  // String? get fcmtoken => _fcmtoken;
  // //
  // final NotificationService _notificationService = NotificationService.instance;
  //
  // NotificationService get notificationService => _notificationService;
  // final Connectivity _connectivity = Connectivity();
  // var isint = false;
  //
  // var msgdata = {};

  void init() async {
    //  isint = true;
//    setIsLoading = true;
    //_notificationService.init(ongetnotification, onTokenRefresh);
    //  _sharedPref = await SharedPreferencesLocal().init();
    //  setFcmToken();

    // _connectivity.onConnectivityChanged.listen(
    //   (ConnectivityResult result) async {
    //     if (_isLoading && result != ConnectivityResult.none) {}
    //   },
    // );

    notifyListeners();
  }

  // void appResume() {
  //   msgdata.addAll({"title": "resume"});
  //
  // }

  void setLocale(Locale locale) {
    //if (!supportedLocalesList.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void creatdDB() {
    // _dbHelper = DBHelper().instance;
    // dbHelper.init();
  }

// void ongetnotification(RemoteMessage data) {
//   msgdata.addAll({"title": "${data.notification?.title}"});
//   notifyListeners();
// }

// void onTokenRefresh(String? token) {
//   _fcmtoken = token;
//   notifyListeners();
// }

// void setFcmToken() {
//   //notificationService.setFCMToken();
//   notifyListeners();
// }
}
