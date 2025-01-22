import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_demo/component/color_cmp.dart';
import 'package:sql_demo/component/fun_cmp.dart';
import 'package:sql_demo/component/messages_cmp.dart';
import 'package:sql_demo/component/text_cmp.dart';
import 'package:sql_demo/db/sql_db.dart';
import 'package:sql_demo/getx_controller/product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    // TODO: implement initState

    productController.initProductFun().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorCmp.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorCmp.white,
          leadingWidth: 0,
          title: text(
            value: "Shoea",
            color: colorCmp.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: productController.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: colorCmp.black,
              ))
            : ListView(
                padding: EdgeInsets.all(15),
                children: [
                  for (int i = 0; i < productController.productLIst.length; i++)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: colorCmp.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 4,
                            color: colorCmp.grey.withOpacity(0.08),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: colorCmp.colorf3f3f3,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.memory(
                                productController.productLIst.value[i].image,
                                height: MediaQuery.of(context).size.width * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                fit: BoxFit.contain),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                text(
                                  value: productController
                                      .productLIst.value[i].name,
                                  color: colorCmp.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: colorCmp.black,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    text(
                                      value: productController
                                          .productLIst.value[i].rating
                                          .toString(),
                                      color: colorCmp.color8b8a88,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    text(
                                      value: productController
                                          .productLIst.value[i].price
                                          .toString(),
                                      color: colorCmp.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(width: 10),
                                    productController.productLIst.value[i]
                                                .quantity ==
                                            null
                                        ? GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                productController.productLIst
                                                    .value[i].quantity = 1;
                                              });
                                              await productController.updateQty(
                                                productModel: productController
                                                    .productLIst.value[i],
                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 20),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: colorCmp.colorf3f3f3,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: text(
                                                value: "Add",
                                                color: colorCmp.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: colorCmp.colorf3f3f3,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () async {
                                                      if (productController
                                                              .productLIst
                                                              .value[i]
                                                              .quantity ==
                                                          1) {
                                                        setState(() {
                                                          productController
                                                              .productLIst
                                                              .value[i]
                                                              .quantity = null;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          productController
                                                              .productLIst
                                                              .value[i]
                                                              .quantity--;
                                                        });
                                                      }

                                                      await productController
                                                          .updateQty(
                                                        productModel:
                                                            productController
                                                                .productLIst
                                                                .value[i],
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: colorCmp.black,
                                                    )),
                                                text(
                                                  value: " " +
                                                      productController
                                                          .productLIst
                                                          .value[i]
                                                          .quantity
                                                          .toString() +
                                                      " ",
                                                  color: colorCmp.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                GestureDetector(
                                                    onTap: () async {
                                                      if (productController
                                                              .productLIst
                                                              .value[i]
                                                              .quantity ==
                                                          5) {
                                                        await toastMessage(
                                                            message:
                                                                "Maximum limit is 5 quantities.");
                                                      } else {
                                                        setState(() {
                                                          productController
                                                              .productLIst
                                                              .value[i]
                                                              .quantity++;
                                                        });
                                                        await productController
                                                            .updateQty(
                                                          productModel:
                                                              productController
                                                                  .productLIst
                                                                  .value[i],
                                                        );
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: colorCmp.black,
                                                    )),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ));
  }
}
