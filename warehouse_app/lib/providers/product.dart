import 'package:warehouse_app/api_utility.dart';
import 'package:warehouse_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  Future<Product> create(ProductDTO product) async {
    final response = await http.post(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.productCreate),
      body: product.toJson(),
    );

    if (response.statusCode == 200) {
      // return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create Product");
    }
  }

  Future<void> delete(int code) async {
    final response = await http.delete(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.productDelete),
      body: code,
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to load Product");
    }
  }

  Future<Product> update(int code, ProductDTO product) async {
    final response = await http.patch(
      Uri.https(
        ApiUtulity.apiConnection,
        ApiUtulity.productUpdate,
      ),
      body: {
        'code': code,
        'product': product.toJson(),
      },
    );

    if (response.statusCode == 200) {
      // return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update Product");
    }
  }

  Future<List<Product>> read(int index, int limit) async {
    final queryParameters = {
      'index': index,
      'limit': limit,
    };

    final response = await http.get(Uri.https(
      ApiUtulity.apiConnection,
      ApiUtulity.productGet,
      queryParameters,
    ));

    if (response.statusCode == 200) {
      // return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get Product");
    }
  }
}
