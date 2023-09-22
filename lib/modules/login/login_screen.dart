import 'package:flutter/material.dart';
import 'package:todo_app/shared/component/components.dart';

//  Reusable Component

// 1. timing
// 2. refactor
// 3. quality

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 16 | 20
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  defaultTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultTextFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    label: 'password',
                    prefix: Icons.lock,
                    suffix: isPassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    onPressedIconSuffix: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    obscureText: isPassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'test',
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    width: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
