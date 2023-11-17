//GENERATED BARREL FILE
import 'package:app_main/domain/domain.dart';
import 'package:app_main/logic/logic.dart';

export './debug/api_service_test.dart';

extension ApiServiceFeature on ServicesSetUp {
  void addApiServiceFeature() {
    IApiService currentApi = ApiServiceTest();
    addService<IApiService>(currentApi);
  }
}
