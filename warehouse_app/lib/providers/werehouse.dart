import 'package:warehouse_app/api_utility.dart';
import 'package:warehouse_app/models/warehouse.dart';
import 'package:http/http.dart' as http;

class WerehouseProvider {
  Future<Warehouse> create(WarehouseDTO warehouse) async {
    final response = await http.post(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.warehouseCreate),
      body: warehouse.toJson(),
    );

    if (response.statusCode == 200) {
      // return warehouse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create warehouse");
    }
  }

  Future<void> delete(int code) async {
    final response = await http.delete(
      Uri.https(ApiUtulity.apiConnection, ApiUtulity.warehouseDelete),
      body: code,
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to load warehouse");
    }
  }

  Future<Warehouse> update(int code, WarehouseDTO warehouse) async {
    final response = await http.patch(
      Uri.https(
        ApiUtulity.apiConnection,
        ApiUtulity.warehouseUpdate,
      ),
      body: {
        'code': code,
        'warehouse': warehouse.toJson(),
      },
    );

    if (response.statusCode == 200) {
      // return warehouse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update warehouse");
    }
  }

  Future<List<Warehouse>> read(int index, int limit) async {
    final queryParameters = {
      'index': index,
      'limit': limit,
    };

    final response = await http.get(Uri.https(
      ApiUtulity.apiConnection,
      ApiUtulity.warehouseGet,
      queryParameters,
    ));

    if (response.statusCode == 200) {
      // return warehouse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get warehouse");
    }
  }
}
