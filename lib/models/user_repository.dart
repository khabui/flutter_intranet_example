import 'api_provider.dart';
import 'random_user_api.dart';

class UserRepository {
  final UserApiProvider _apiProvider = UserApiProvider();

  Future<List<User>> getUser({int numbers = 10, String nationalities}) {
    return _apiProvider.fetchUsers(
      numbers: numbers,
      nationalities: nationalities,
    );
  }
}
