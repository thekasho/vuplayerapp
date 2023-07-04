part of 'api.dart';

class AuthApi {
  Future<UserModel?> registerUser(
    String username,
    String password,
    String link,
    String name,
  ) async {
    try {
      // Response<String> response = await _dio
      //     .get("$link/player_api.php?username=$username&password=$password");
      Response<String> response = await _dio
          .get("http://captintv.xyz:80/player_api.php?username=849202944893&password=8392945949932");

      if (response.statusCode == 200) {
        var json = jsonDecode(response.data ?? "");
        final user = UserModel.fromJson(json);
        //save to locale
        await LocaleApi.saveUser(user);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }
}
