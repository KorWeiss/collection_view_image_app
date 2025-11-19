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
  late Datastorage detailFlower;    //  넘어온 argument 받아올 변수

  @override
  void initState() {
    super.initState();
    detailFlower = Get.arguments;   //  Get.argument를 사용하여 넘어온 변수 받아오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: restiApB(
        appBarText: detailFlower.flowerName,    //  넘어온 꽃 이름으로 타이틀 설정
        align: AppbarAlign.c,
      ),
      body: Center(
        child: Image.asset(
          detailFlower.imagePath,   //  넘어온 꽃 imagePath를 이용하여 이미지 표기
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
