import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopping_clothes_app/controller/product_controller.dart';

class HomeView extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  final List categories = [
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: Container(
        constraints: BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTop(),
              _buildCategoriesRow(),
              Expanded(
                child: Obx(
                  () {
                    if (productsController.loading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (productsController.products.isEmpty) {
                      return Center(child: Text("No products found"));
                    }
                    if (productsController.showgrid.value)
                      return GridView.builder(
                        padding: EdgeInsets.only(top: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: productsController.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 0.0,
                            child: Container(
                              height: 150,
                              padding: EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(productsController
                                            .products[index]["image"]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productsController.products[index]
                                                ["title"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              productsController.products[index]
                                                  ["description"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "\$${productsController.products[index]["price"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    return _buildProductsList();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 120,
          padding: EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[index]["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsController.products[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          productsController.products[index]["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${productsController.products[index]["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cloths",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              productsController.toggleGrid();
            },
            icon: Icon(Icons.filter_list)),
      ],
    );
  }

  Container _buildCategoriesRow() {
    return Container(
      height: 35.0,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: index == 0 ? Colors.black87 : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              color: index == 0 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: BackButton(),
      elevation: 0,
      title: Text(
        "NShop",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopping_clothes_app/controller/product_controller.dart';
// import 'package:shopping_clothes_app/models/products.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final ProductsController productsController = Get.put(ProductsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: _buildAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildtop(),
//             _buildercategoriesrow(),
//             Expanded(
//               child: Obx(() {
//                 if (productsController.loading.value) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (productsController.products.isEmpty) {
//                   return Center(child: Text('No products available'));
//                 }
//                 // if (productsController.showgrid.value)
//                 return 
               
//                 GridView.builder(
//                   padding: EdgeInsets.only(top: 16),
                  
//                   itemCount: productsController.products.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount:2,
//                           // productsController.showgrid.value ? 2 : 1,
//                           childAspectRatio: 0.8
//                           ),
                          
//                   itemBuilder: (context, index) {
//                     final product = ProductsModel.fromJson(
//                         productsController.products[index]);
//                     return ProductCard(product: product);
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final ProductsModel product;
//   ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0.0,
//       child: Container(
//         // height: 120,
//         padding: EdgeInsets.all(16),
//         margin: EdgeInsets.only(bottom: 8),
//         child: Column(
//           children: [
//             Container(
//                 margin: EdgeInsets.only(bottom: 8),
//                 // width: 150,
//                 height: 150,
//                 child: Image.network(
//                   product.image,
//                   fit: BoxFit.fitHeight,
//                 )),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(product.title,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text(
//                     product.description,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                     // style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text("\$${product.price}",
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Padding _buildtop() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//     child: Row(
//       children: [
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(color: Colors.white),
//             padding: EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Clothes",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                     //  onPressed: productsController.toggleGrid,
//                     onPressed: () {
//                       // ProductsController.
//                     },
//                     // icon: Obx(() => Icon(productsController.showgrid.value ?
//                     // Icons.grid_on : Icons.list))
//                     icon: Icon(Icons.list)),
//               ],
//             ),
//           ),
//         ),
//         IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))
//       ],
//     ),
//   );
// }

// Padding _buildercategoriesrow() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//     child: Container(
//       height: 35,
//       margin: EdgeInsets.only(top: 16),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         // itemCount: categories.length,
//         itemBuilder: (context, index) => Container(
//           margin: EdgeInsets.only(right: 8),
//           decoration: BoxDecoration(
//               color: index == 0 ? Colors.black87 : Colors.transparent,
//               borderRadius: BorderRadius.circular(4)),
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Text(
//             "categories",
//             style: TextStyle(color: index == 0 ? Colors.white : Colors.black),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// AppBar _buildAppBar() {
//   return AppBar(
//     backgroundColor: Colors.white,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: Colors.black),
//     leading: BackButton(),
//     elevation: 0,
//     title: Text(
//       "Shop Ecco",
//       style: TextStyle(color: Colors.black),
//     ),
//     actions: [
//       IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//       IconButton(
//           onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
//       IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
//     ],
//   );
// }
