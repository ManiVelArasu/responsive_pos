import 'package:get/get.dart';

import '../data_services/api_helper.dart';
import '../data_services/api_type_enum.dart';
import '../helper/error_handler.dart';
import '../utils/api_end_points.dart';

class ActiveRepository {
  final ApiHelper _apiHelper = Get.find();

  Future<dynamic> activeList(dynamic body)async{


    var data = await errorHandler(
        _apiHelper.multiMethod(
          baseUrl,
          appConfig,
          body: body,
          methodType: ApiTypeEnum.post,
        )
    );


  }

}
