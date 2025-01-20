import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_demo/component/color_cmp.dart';
import 'package:sql_demo/component/fun_cmp.dart';
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
                      height: 100,
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
                          Image.memory(
                            productController.productLIst.value[i].image,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                ],
              ));
  }
}
