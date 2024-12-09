import 'package:dio/dio.dart';
import 'package:flutter_nusacodes_2/data/remote_data/auth_remote_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_classes.mocks.dart';

void main() {
  late MockNetworkService mockNetworkService;
  late AuthRemoteData authRemoteData;

  setUp(() {
    mockNetworkService = MockNetworkService();
    authRemoteData = AuthRemoteData(mockNetworkService);
  });

  group("postLogin()", () {
    test("return User jika login berhasil", () async {
      const path = "/api/auth/login";
      final mockResponse = Response(
          requestOptions: RequestOptions(path: path),
          statusCode: 200,
          data: {
            "data": {
              "user": {
                "name": "Admin",
                "email": "admin@gmail.com",
              },
              "access_token": "mocked_token"
            }
          });

      when(mockNetworkService.post(
              url: anyNamed("url"), data: anyNamed("data")))
          .thenAnswer((_) async => mockResponse);

      final response =
          await authRemoteData.postLogin("admin@gmail.com", "123456");

      expect(response.accessToken, "mocked_token");
      expect(response.user?.name, "Admin");
      expect(response.user?.email, "admin@gmail.com");
      verify(mockNetworkService.post(
          url: "/api/auth/login",
          data: {"email": "admin@gmail.com", "password": "123456"})).called(1);
    });

    test("throw Error jika login gagal", () {
      when(mockNetworkService.post(
              url: anyNamed("url"), data: anyNamed("data")))
          .thenThrow(Exception("Login Failed"));

      expect(() => authRemoteData.postLogin("admin@gmail.com", "12345678"),
          throwsException);
    });
  });
}
