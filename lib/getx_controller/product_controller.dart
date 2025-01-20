import 'package:get/get.dart';
import 'package:sql_demo/db/sql_db.dart';
import 'package:sql_demo/model/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productLIst = <ProductModel>[].obs;
  var isLoading = true.obs;
  Future initProductFun() async {
    await getProductData();
  }

  getProductData() async {
    try {
      isLoading(true);

      productLIst.value = await SQLDatabase.instance.getDbData();

      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }
}
