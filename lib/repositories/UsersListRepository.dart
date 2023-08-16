import 'package:flutter_mmv_with_getx/models/UsersList.dart';

import '../data/network/NetworkApiService.dart';
import '../res/app_url/app_urls.dart';

class UserListRepository {
  final _apiServices = NetworkApiService();

  Future<UsersList> getUserList(int pageNo) async {
    try {
      final queryParams = {
        'page': pageNo.toString(),
      };
      dynamic response = await _apiServices.getGetApiResponse(AppUrls.usersListApi, queryParams);
      return UsersList.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
