import 'package:flutter/cupertino.dart';
import '../repository/active_repository.dart';
import 'my_notifier.dart';

class HomeScreenProvider extends ChangeNotifier with MyNotifier {
  final ActiveRepository _activeRepository = ActiveRepository();
  ScrollController scrollController = ScrollController();

  Future<dynamic> callLogin() async {
    setIsLoading = true;
    setIsError = false;
    var data = await _activeRepository.activeList("{body}");

    if (data != null) {
    } else {
      setIsError = true;
    }

    setIsLoading = false;
  }
}
