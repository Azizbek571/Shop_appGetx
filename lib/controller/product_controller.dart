import 'package:get/get.dart';
import 'package:shopping_clothes_app/controller/prooducts_repositories.dart';

class ProductsController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  RxBool loading = false.obs;
  List products = [].obs;
  var showgrid = false.obs;

  ProductsController() {
    loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    products = await productsRepository.loadProductsFromApi();
    loading(false);
  }

  toggleGrid() {
    showgrid(!showgrid.value);
  }
}

 //   toggleGrid() {
//     showgrid(!showgrid.value);
//   }


// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:shopping_clothes_app/models/products.dart';

// class ProductsController extends GetxController {
//   RxBool loading = false.obs;
//   Dio http = Dio();
//   List<ProductsModel> products = [];

//   var showgrid = false.obs;

//   fetchProducts() async {
//     loading = true.obs;
//     update();
//     try {
//       await Future.delayed(Duration(seconds: 3));
//       var res = await http.get('https://fakestoreapi.com/products');
//       products = productModelFromJson(res.data);
//     } catch (err) {
//       print(err);
//     } finally {
//       loading = false.obs;
//       update();
//     }
//   }

//   toggleGrid() {
//     showgrid(!showgrid.value);
//   }

//   @override
//   void onInit() {
//     fetchProducts();
//     super.onInit();
//   }
// }
