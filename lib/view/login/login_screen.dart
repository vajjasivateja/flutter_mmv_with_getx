import 'package:flutter/material.dart';
import 'package:flutter_mmv_with_getx/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../res/components/rounded_button.dart';
import '../../res/routes/routes_name.dart';
import '../../viewModels/controllers/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = Get.put(LoginViewModel());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginViewModel.emailController.value,
                      focusNode: loginViewModel.emailFocusNode.value,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "email_hint".tr,
                        labelText: "email_hint".tr,
                        prefixIcon: const Icon(Icons.email),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.errorSnackBar("Email", "Please enter email");
                        }
                      },
                      onFieldSubmitted: (value) {
                        Utils.filedFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: loginViewModel.passwordController.value,
                        focusNode: loginViewModel.passwordFocusNode.value,
                        obscureText: true,
                        obscuringCharacter: "*",
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "password_hint".tr,
                          labelText: "password_hint".tr,
                          prefixIcon: const Icon(Icons.key),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.errorSnackBar("Password", "Please enter Password");
                          }
                        },
                        onFieldSubmitted: (value) {}),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Obx(
                () => RoundButton(
                  title: "login".tr,
                  callback: () {
                    if (_formKey.currentState!.validate()) {
                      loginViewModel.loginApi();
                    }
                  },
                  loading: loginViewModel.loading.value,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signup_screen);
                  },
                  child: Text("dont_have_account_signup".tr))
            ],
          ),
        ),
      ),
    );
  }
}
