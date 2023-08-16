import 'package:flutter_mmv_with_getx/data/network/NetworkApiService.dart';
import 'package:flutter_mmv_with_getx/res/app_url/app_urls.dart';

class LoginRepository {
  final _apiServices = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrls.loginApi, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
