import 'package:get/get.dart';
import 'package:shopsy_app/model/dbhelper.dart';
import 'package:shopsy_app/model/product.dart';

class CartController extends GetxController {
  RxList<Product> proList = <Product>[].obs;

  void fetchProduct() async {
    DBHelper helper = DBHelper();
    List<Map<String, Object?>>? data = await helper.getProduct();
    proList.value = data?.map((e) {
          return Product.fromJson(e);
        }).toList() ??
        [];
  }

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }
}
