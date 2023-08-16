abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url, dynamic queryParams);

  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
