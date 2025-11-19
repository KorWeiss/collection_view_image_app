import 'package:flutter/material.dart';

//  text custom
enum TextSize { s, b }

Text textBS({
  required String text,
  TextStyle? textstyle,
  TextSize fontsize = TextSize.b,
}) {
  switch (fontsize) {
    case TextSize.s:
      return Text(text, style: textstyle ?? styleBS(fontSize: 15));
    case TextSize.b:
      return Text(text, style: textstyle ?? styleBS(fontSize: 20));
  }
}

Text textWS({
  required String text,
  TextStyle? textstyle,
  TextSize fontsize = TextSize.b,
}) {
  switch (fontsize) {
    case TextSize.s:
      return Text(text, style: textstyle ?? styleWS(fontSize: 15));
    case TextSize.b:
      return Text(text, style: textstyle ?? styleWS(fontSize: 20));
  }
}

TextStyle styleBS({
  Color? color,
  double? fontSize = 20,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle styleWS({
  Color? color,
  double? fontSize = 20,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

//  appbar custom

enum AppbarAlign { l, r, c }

PreferredSizeWidget restiApB({
  required String appBarText,
  Color bgc = Colors.white,
  Widget? leading,
  AppbarAlign align = AppbarAlign.l,
  TextStyle? appBartextstyle,
  List<Widget>? actions,
}) {
  Widget titleWidget;
  switch (align) {
    case AppbarAlign.l:
      titleWidget = (Align(
        alignment: Alignment.centerLeft,
        child: textBS(
          text: appBarText,
          textstyle: appBartextstyle ?? styleBS(),
        ),
      ));
      break;
    case AppbarAlign.r:
      titleWidget = (Align(
        alignment: Alignment.centerRight,
        child: textBS(
          text: appBarText,
          textstyle: appBartextstyle ?? styleBS(),
        ),
      ));
      break;
    default:
      titleWidget = textBS(
        text: appBarText,
        textstyle: appBartextstyle ?? styleBS(),
      );
      break;
  }

  return AppBar(
    backgroundColor: bgc,
    centerTitle: align == AppbarAlign.c,
    title: titleWidget,
    leading: leading,
    actions: actions,
  );
}

//  button custom

enum ButtonType { eb, tb, ob, ib, fa }

enum ChildType { i, t }

Widget restiButtons({
  required VoidCallback onPressed,
  ButtonType buttonType = ButtonType.eb,
  Color buttonColor = Colors.blue,
  Color? buttonBackgroundColor,
  String buttonText = 'Test',
  Color? textColor,
  IconData iconData = Icons.star,
  ChildType childType = ChildType.t,
}) {
  Widget buildChild() {
    switch (childType) {
      case ChildType.t:
        return Text(
          buttonText,
          style: styleWS(color: textColor ?? Colors.white),
        );
      case ChildType.i:
        return Icon(iconData, color: buttonColor);
    }
  }

  switch (buttonType) {
    case ButtonType.eb:
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(150, 40),
        ),
        child: buildChild(),
      );

    case ButtonType.tb:
      return TextButton(onPressed: onPressed, child: buildChild());

    case ButtonType.ob:
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          side: BorderSide(color: Colors.black, width: 2),
        ),
        child: buildChild(),
      );
    case ButtonType.ib:
      return IconButton(
        onPressed: onPressed,
        icon: Icon(iconData, color: textColor ?? Colors.black),
        style: IconButton.styleFrom(
          backgroundColor: buttonBackgroundColor ?? Colors.transparent,
        ),
      );
    case ButtonType.fa:
      return FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: buttonColor,
        child: buildChild(),
      );
  }
}

  //  Unfocus
  /*  GestureDetector(
  behavior: HitTestBehavior.translucent,
  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
  child: Scaffold(
  */

  //  Bottom Tabbar
  /*
  bottomNavigationBar: Material(
          // TabBar는 Material 위에 있어야 밑줄/효과가 제대로 나옴
          color: Colors.blue,
          child: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        */