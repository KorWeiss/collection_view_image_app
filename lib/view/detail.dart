import 'package:collection_view_image_app/model/dataStorage.dart';
import 'package:collection_view_image_app/resticustoms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Datastorage detailFlower;

  @override
  void initState() {
    super.initState();
    detailFlower = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: restiApB(
        appBarText: detailFlower.flowerName,
        align: AppbarAlign.c,
      ),
      body: Center(
        child: Image.asset(
          detailFlower.imagePath,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
