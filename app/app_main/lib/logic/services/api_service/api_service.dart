//GENERATED BARREL FILE
import 'package:app_main/domain/domain.dart';
import 'package:app_main/logic/logic.dart';
import 'package:app_main/logic/services/api_service/api_app_service.dart';

export './debug/api_service_test.dart';

extension ApiServiceFeature on ServicesSetUp {
  void addApiServiceFeature() {
    IApiService currentApi = ApiAppService();
    addService<IApiService>(currentApi);
  }
}
