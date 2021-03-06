import 'package:flutter/material.dart';
import 'package:jh_flutter_demo/configs/strings.dart';
import 'package:jh_flutter_demo/baseAppBar.dart';

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      baseAppBar(context, KString.threeTabTitle,),
      body: testBtn(context),
    );
  }
}

Widget testBtn(context){
  return Container(
      alignment: Alignment.center, //子组件将以何种方式进行排列
      margin: EdgeInsets.all(20), //容器外补白
      color: Colors.yellow,
      width: 200,
      height: 200,
      child:RaisedButton(
//        color: Colors.red,
        child: Text("点击跳转"),
        onPressed: () {
          print('onPressed');

          Navigator.pushNamed(context, "UIDemoListsPage");

//          Navigator.push(context, MaterialPageRoute(builder: (context) => (TestPage())));//普通路由
//          Navigator.push(context, MaterialPageRoute(builder: (context) => (testPage(content: "这是route传递的参数",))));//普通路由
//          Navigator.pushNamed(context,'/Test');//命名路由

        },
      )
  );
}
