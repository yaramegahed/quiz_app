import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/view/quiz_screen.dart';
import '../../../core/colors/colors.dart';
import '../../../core/widget/custom_button.dart';
import '../controller/login_controller.dart';
import '../widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late final LoginScreenController loginScreenController =
      LoginScreenController();

  @override
  void dispose() {
    loginScreenController.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/loginScreen.png")),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage("assets/images/Q.png"),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    "Enter your name",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.kPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Form(
                      key: loginScreenController.formKey,
                      autovalidateMode: autoValidateMode,
                      child: CustomTextField(
                        controller: loginScreenController.textEditingController,
                        onChanged: (value) {
                          loginScreenController.onChangedTextFormField();
                        },
                      )),
                  Spacer(),
                  CustomButton(
                    onTap: () {
                      loginScreenController.textEditingController.text;
                      print(loginScreenController.textEditingController.text);
                      Navigator.pushReplacement(
                          context,
                          CupertinoModalPopupRoute(
                            builder: (context) => QuizScreen(
                              name: loginScreenController
                                  .textEditingController.text,
                            ),
                          ));
                    },
                    title: 'Start',
                    isActive: loginScreenController.isActive,
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
