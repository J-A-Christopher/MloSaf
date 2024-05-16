import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/elevated_button.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
import 'package:mlosafi/common/utils/storage_utils.dart';
import 'package:mlosafi/di/di.dart';
import 'package:mlosafi/features/login/Data/model/login_body.dart';
import 'package:mlosafi/features/login/presentation/bloc/login_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email = '';
  String? password = '';
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  void submitLoginData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final logInData = LoginBody(email: email!, password: password!).toJson();
      context.read<LoginBloc>().add(LoginUser(loginData: logInData));
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: ListView(
          children: [
            Text(
              'Just SignIn , we\'ll prepare your order.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: sizedObject.height * 0.02,
            ),
            Row(
              children: [
                const TitleText(
                    titleText: 'If you don\'t have an account please'),
                TextButton(
                    onPressed: () {
                      context.push('/signUp');
                    },
                    child: const Text('Sign up here'))
              ],
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sizedObject.height * 0.02,
                    ),
                    const TitleText(titleText: 'Email address'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                        onSaved: (String? value) {
                          email = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid input ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email Address',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    const TitleText(titleText: 'Password'),
                    TextFormField(
                        onSaved: (String? value) {
                          password = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Input cannot be empty';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: !_obscureText
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: sizedObject.width * 0.6),
                      child: TextButton(
                          onPressed: () {
                            context.push('/forgot-password');
                          },
                          child: const Text('Forgot Password?')),
                    )
                  ],
                )),
            SizedBox(
              width: sizedObject.width * 0.7,
              height: sizedObject.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  submitLoginData();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('SIGN IN'),
              ),
            ),
            SizedBox(
              height: sizedObject.height * 0.02,
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginInLoaded) {
                  final accessToken = state.token.toString();
                  getIt<StorageUtils>()
                      .writeUserInfo(key: 'token', userInfo: accessToken);
                  Map<String, dynamic> decodedToken =
                      JwtDecoder.decode(accessToken);
                  final userName = decodedToken['username'];
                  getIt<StorageUtils>()
                      .writeUserInfo(key: 'username', userInfo: userName);

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful')));
                  context.go('/first-route');
                } else if (state is LoginInError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              },
              child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                if (state is LoginInLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox();
              }),
            ),
            SizedBox(
              height: sizedObject.height * 0.08,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: sizedObject.width * 0.4),
              child: const Text('OR'),
            ),
            SizedBox(
              height: sizedObject.height * 0.06,
            ),
            ElevatedButtonCustomized(
              btnText: 'Connect with Facebook',
              func: () {},
              imagePath: 'assets/fb.png',
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            ElevatedButtonCustomized(
              btnText: 'Connect with Google',
              func: () {},
              imagePath: 'assets/google.png',
            )
          ],
        ),
      ),
    );
  }
}
