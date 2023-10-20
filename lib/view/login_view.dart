import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoppers_bay/res/colors.dart';
import 'package:shoppers_bay/res/dimension.dart';
import 'package:shoppers_bay/res/widgets/button.dart';
import 'package:shoppers_bay/utils/utils.dart';
import 'package:shoppers_bay/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obscure = ValueNotifier(true);
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    pwdcontroller.dispose();
    nameFocus.dispose();
    pwdFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.themeColor1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: height * .55,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.themeColor1, width: 10),
                color: AppColor.whitecolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDimension.bradius2),
                    bottomRight: Radius.circular(AppDimension.bradius2))),
            width: height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  focusNode: nameFocus,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, nameFocus, pwdFocus);
                  },
                  controller: namecontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_rounded,
                      ),
                      hintText: 'username'),
                ),
                ValueListenableBuilder(
                    valueListenable: obscure,
                    builder: ((context, value, child) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: pwdFocus,
                        controller: pwdcontroller,
                        obscuringCharacter: '.',
                        obscureText: obscure.value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: (obscure.value)
                                ? IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () {
                                      obscure.value = !obscure.value;
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: () {
                                      obscure.value = !obscure.value;
                                    },
                                  ),
                            hintText: 'password'),
                      );
                    })),
                RoundButton(
                  title: 'L O G I N',
                  onTap: () {
                    if (namecontroller.text.isEmpty)
                      Utils.showSnackbar('username can\'t be empty', context);
                    else if (namecontroller.text.length < 6)
                      Utils.showSnackbar(
                          'username must be atleast 6 in length', context);
                    else if (pwdcontroller.text.isEmpty)
                      Utils.showSnackbar('password can\'t be empty', context);
                    else if (namecontroller.text.length < 6)
                      Utils.showSnackbar(
                          'password must be atleast 6 in length', context);
                    else {
                      AuthViewModel().loggingIn(context, namecontroller.text);
                    }
                  },
                  loading: AuthViewModel().loading,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?  '),
                    TextButton(
                        onPressed: () {
                          Utils.showSnackbar('logging in', context);
                        },
                        child: Text('SIGN UP'))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
