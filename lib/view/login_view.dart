import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/resources/components/round_button.dart';
import 'package:flutter_api_mvvm/utils/showing_info/methods.dart';
import 'package:flutter_api_mvvm/utils/showing_info/toast_message.dart'
    as toastingMessage;
import 'package:flutter_api_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/constants/constant_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final ValueNotifier<bool> _obscurePassword;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _obscurePassword = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                fieldFocusChange(
                    context: context,
                    currentFocus: _emailFocusNode,
                    nextFocus: _passwordFocusNode);
              },
              decoration: const InputDecoration(
                label: Text(
                  'Email',
                ),
                prefixIcon: Icon(
                  Icons.alternate_email,
                ),
                hintText: 'Email',
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword.value,
                  obscuringCharacter: '*',
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    label: const Text(
                      'Password',
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                    ),
                    hintText: 'Password',
                    suffixIcon: InkWell(
                      onTap: () =>
                          _obscurePassword.value = !_obscurePassword.value,
                      child: Icon(
                        (_obscurePassword.value)
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.085,
            ),
            Consumer<AuthViewModel>(
              builder: (context, value, child) => RoundButton(
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    toastingMessage.flushBarErrorMessage(
                        'Please Enter Email', context);
                  } else if (_passwordController.text.isEmpty) {
                    toastingMessage.flushBarErrorMessage(
                        'Please Enter Password', context);
                  } else if (_passwordController.text.length < 6) {
                    toastingMessage.flushBarErrorMessage(
                        'Please Enter 6 Digits Password', context);
                  } else {
                    final data = {
                      'email': _emailController.text,
                      'password': _passwordController.text
                    };
                    authViewModel.login(data: data, context: context);
                  }
                },
                title: 'Login',
                isLoading: value.isLoading,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(kSignUpScreen);
              },
              child: const Text(
                'Don\'t have an account?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
