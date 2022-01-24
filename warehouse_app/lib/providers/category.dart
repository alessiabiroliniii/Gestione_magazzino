import 'package:warehouse_app/api_utility.dart';
import 'package:warehouse_app/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  Future<Category> create(Category category) async {
    final response = await http.post(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.categoryCreate),
      body: category.toJson(),
    );

    if (response.statusCode == 200) {
      // return category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create category");
    }
  }

  Future<void> delete(int code) async {
    final response = await http.delete(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.categoryDelete),
      body: code,
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to load category");
    }
  }

  Future<Category> update(int code, CategoryDTO category) async {
    final response = await http.patch(
      Uri.https(
        ApiUtulity.apiConnection,
        ApiUtulity.categoryUpdate,
      ),
      body: {
        'code': code,
        'category': category.toJson(),
      },
    );

    if (response.statusCode == 200) {
      // return category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update category");
    }
  }

  Future<List<Category>> read(int index, int limit) async {
    final response = await http.get(Uri.https(
      ApiUtulity.apiConnection,
      ApiUtulity.categoryGet,
      {
        'index': index,
        'limit': limit,
      },
    ));

    if (response.statusCode == 200) {
      // return category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get category");
    }
  }
}
