import 'package:flutter/material.dart';
import 'package:jh_flutter_demo/baseAppBar.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:jh_flutter_demo/JhTools/JhForm/jhKeyboardUtils.dart';
import 'package:jh_flutter_demo/JhTools/JhForm/jhLoginTextField.dart';
import 'package:jh_flutter_demo/JhTools/JhForm/jhCountDownBtn.dart';
import 'package:jh_flutter_demo/JhTools/widgets/jhButton.dart';
import 'package:jhtoast/jhtoast.dart';
import 'package:jh_flutter_demo/configs/colors.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _codeController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  final FocusNode _node1 = FocusNode();
  final FocusNode _node2 = FocusNode();
  final FocusNode _node3 = FocusNode();

  var _phone ='';
  var _code = '';
  var _pwd = '';



  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(

          appBar:
          backAppBar(context, '账号注册',),
          body:  KeyboardActions(
            config: JhKeyboardUtils.getKeyboardConfig(context, [_node1,_node2,_node3]),
            child: _mainBody(),
          )

      );
  }

  Widget _mainBody(){
    return
    Stack(

      children: <Widget>[

        SingleChildScrollView(
          child:
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

//                SizedBox(height: 50),
                JhLoginTextField(text:_phone,hintText: "请输入手机号",labelText:'手机号',focusNode:_node1,maxLength: 11,
                    keyboardType:TextInputType.number,
                    inputCallBack: (value)=> _phone=value
                ),
                SizedBox(height: 10),

                JhLoginTextField(hintText: "请输入验证码",labelText:'验证码',focusNode:_node2,maxLength: 6,
                    keyboardType:TextInputType.number,
                    rightWidget:
                    JhCountDownBtn(
                        showBorder: true,
                        getVCode:()async {
                          return true;
                        }
                    ),
                    inputCallBack: (value)=> _code =value
                ),
                SizedBox(height: 10),

                JhLoginTextField(hintText: "请输入密码",labelText:'密码',focusNode:_node3,isShowDeleteBtn: true,isPwd: true,
                    pwdClose: 'assets/images/ic_pwd_close.png',pwdOpen: 'assets/images/ic_pwd_open.png',
                    inputCallBack: (value)=>_pwd =value

                ),

                SizedBox(height: 15),
                SizedBox(height: 50),
                JhButton(text: "注 册",
                    onPressed: _ClickOkBtn
                )
              ],
            ),

          ),
        )

      ],
    );


  }


  void _ClickOkBtn() async {

//    Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => BaseTabBar()
//        ), (route) => route == null);

//    Navigator.pushReplacementNamed(context, "BaseTabBar");




    var hide =  JhToast.showLoadingText_iOS(context,
      msg:"正在注册...",
    );
    Future.delayed(Duration(seconds: 1),(){

      Navigator.pop(context);
      hide();

    });


  }


}


