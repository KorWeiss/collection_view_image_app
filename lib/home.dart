import 'dart:math';

import 'package:collection_view_image_app/model/dataStorage.dart';
import 'package:collection_view_image_app/resticustoms.dart';
import 'package:collection_view_image_app/view/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late List<Datastorage> flowers;   //  Datastorage 모델형 리스트 선언
  final String warning = 'All rights reserverd!';   //  사진 위에 띄울 텍스트 설정

  @override
  void initState() {
    super.initState();
    flowers = [];
    initflowers();    //  Datastorage 추가
  }

  initflowers() {
    flowers.add(
      Datastorage(imagePath: 'images/flower_01.png', flowerName: '진달래'),
    );
    flowers.add(
      Datastorage(imagePath: 'images/flower_02.png', flowerName: '자목련'),
    );
    flowers.add(
      Datastorage(imagePath: 'images/flower_03.png', flowerName: '벚꽃'),
    );
    flowers.add(
      Datastorage(imagePath: 'images/flower_04.png', flowerName: '흰 철쭉'),
    );
    flowers.add(
      Datastorage(imagePath: 'images/flower_05.png', flowerName: '산철쭉'),
    );
    flowers.add(
      Datastorage(imagePath: 'images/flower_06.png', flowerName: '튤립'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: restiApB(appBarText: 'Flower Garden', align: AppbarAlign.c),
      body: GridView.builder(
        /*  총 아이템 갯수는 flowers와 동일
        2개의 아이템마다 줄 바꾸기, 각각 공간은 10으로 설정*/
        itemCount: flowers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(Detail(), arguments: flowers[index]);
              //  각 카드를 클릭 시에 Detail 페이지로 넘어가면서 arguments로 선택한 꽃의 정보도 넘어감
            },
            child: SizedBox(
              child: Card(
                elevation: 10,  //  카드가 떠있어 보이는 효과 설정
                child: Column(
                  children: [
                    Stack(    //  Stack형으로 이미지와 텍스트가 같이 나올 수 있게 함
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(20),  //  카드 모서리를 둥글게
                            child: Image.asset(
                              flowers[index].imagePath,
                              width: 100,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          /*  일단은 글자가 대충 가운데에 오게끔 Position을 사용하여 설정, 차후에 Bottom값을 변수로 받아서 사용 가능
                          */
                          bottom: 50,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Transform.rotate(
                              angle: -90 * pi / 360,  //  평소에 회전용으로 쓰던 걸 사용, Radian 값 (원하는 각도) * pi/360
                              child: textBS(  //  커스텀 함수, 글자 크기 및 볼드체 설정
                                text: warning,
                                textstyle: styleWS(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    textBS(text: flowers[index].flowerName),    //  꽃의 이름, GPT 돌려서 알아옴
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
