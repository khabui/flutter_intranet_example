import 'package:dio/dio.dart';

import 'random_user_api.dart';

class UserApiProvider {
  List<User> users = [];

  Future<List<User>> fetchUsers(
      {int numbers = 10, String nationalities = 'us'}) async {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://randomuser.me/api/?',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    final Dio _dio = Dio(options);

    try {
      final Response response = await _dio.get(
        'https://randomuser.me/api/?',
        queryParameters: {'results': numbers, 'nat': nationalities},
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;

        final RandomUserApi _temp = RandomUserApi.fromJson(
            responseBody is Map<String, dynamic> ? responseBody : null);

        _temp.users.sort((a, b) {
          final _temp = a.name.first.compareTo(b.name.first);
          if (_temp != 0) return _temp;
          return a.name.last.compareTo(b.name.last);
        });
        return _temp.users;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
