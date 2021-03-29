import 'package:flutter_app/api/api_product.dart';
import 'package:flutter_app/api/api_qr_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  MockClient mockClient;
  ApiProduct product = new ApiProduct();
  ApiQrCode qrCode = new ApiQrCode();

  setUp(() {
    mockClient = MockClient();
  });

  tearDown((){
    mockClient = null;
  });

  group('tests', () {
    test(' Matching login & password', () async {
      when(mockClient.post(
          "https://apicoupons.azurewebsites.net/client_space/log",
          body: '{"login_mail": "mail3", "password": "pass3"}',
          headers: {"content-type": "application/json"}))
          .thenAnswer((_) async => http.Response('{"status": 200}', 200));
    });

    test('Existing Login but Not Matching password', () async {
      when(mockClient.post(
          "https://apicoupons.azurewebsites.net/client_space/log",
          body: '{"login_mail": "mail5", "password": "pass1"}',
          headers: {"content-type": "application/json"}))
          .thenAnswer((_) async => http.Response('{"status": 400}', 400));
    });

    test('Create space not existing login', () async {
      when(mockClient.post(
          "https://apicoupons.azurewebsites.net/client_space/create",
          body: '{"login_mail": "mail5notexist", "password": "pass1notexist"}',
          headers: {
            "content-type": "application/json"
          })).thenAnswer((_) async => http.Response('{"status": 200}', 200));
    });

    test('Create space with existing login', () async {
      when(mockClient.post(
          "https://apicoupons.azurewebsites.net/client_space/create",
          body: '{"login_mail": "mail5notexist", "password": "pass1notexist"}',
          headers: {
            "content-type": "application/json"
          })).thenAnswer((_) async => http.Response('{"status": 409}', 409));
    });

    test('No existing login', () async {
      when(mockClient.post(
          "https://apicoupons.azurewebsites.net/client_space/log",
          body: '{"login_mail": "mail5notexist", "password": "pass1notexist"}',
          headers: {
            "content-type": "application/json"
          })).thenAnswer((_) async => http.Response('{"status": 404}', 404));
    });

    test('returns all productS ', () async {
      final client = MockClient();

      when(client.post(
          'https://apicoupons.azurewebsites.net/couponresponse/ville/all'))
          .thenAnswer((_) async => http.Response('{"status": 200}', 200));

      expect(await product.getAllProductHtpp(), isA<List>());
    });

    test('return a product by email', () async {
      final client = MockClient();

      when(client
          .post('https://apicoupons.azurewebsites.net/clientspace/coupons'))
          .thenAnswer((_) async => http.Response('{"status": 200}', 200));

      expect(await product.getCoupons('mail5'), isA<List>());
    });

    test('return a product by code', () async {
      final client = MockClient();

      when(client.post('https://apicoupons.azurewebsites.net/couponresponse/'))
          .thenAnswer((_) async => http.Response('{"status": 200}', 200));

      expect(await qrCode.getCodePromos('1'), isA<List>());
    });

  });
}
