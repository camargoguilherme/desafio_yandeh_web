import '../../../core/network/interfaces/i_http_client.dart';
import '../../../core/utils/return_data.dart';
import '../models/section_model.dart';

class ProductService {
  ProductService(this._client);
  final IHttpClient _client;

  Future<ReturnData<List<SectionModel>>> getProducts({
    String arguments = '*',
    bool original = true,
  }) async {
    try {
      final response = await _client.get(
          "/process/candidates/search-products?argument=$arguments&original=$original");

      return ReturnData(true,
          data: response.data['sections'] != null
              ? (response.data['sections'] as List)
                  .map((i) => SectionModel.fromJson(i))
                  .toList()
              : []);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
