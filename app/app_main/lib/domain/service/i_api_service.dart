import '../domain.dart';

abstract interface class IApiService {
  Future<bool> post(Contact contact);
}
