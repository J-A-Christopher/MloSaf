import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/elevated_button.dart';
import 'package:mlosafi/common/reusables/title_text.dart';
import 'package:mlosafi/features/signup/data/models/signup_model.dart';
import 'package:mlosafi/features/signup/presentation/bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var fname = '';
  var lname = '';
  var username = '';
  var email = '';
  var password = '';
  final _signUpFormState = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _cpobscureText = true;
  TextEditingController passwordController = TextEditingController();
  void submitSignUpData() {
    if (_signUpFormState.currentState!.validate()) {
      _signUpFormState.currentState!.save();
      var userSignUpData =
          SignUpModelBody(fname, lname, username, email, password).toJson();
      context.read<SignUpBloc>().add(OnSignUp(signUpData: userSignUpData));
      _signUpFormState.currentState!.reset();
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
              'Let\'s Sign you up , your meal awaits.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            Form(
                key: _signUpFormState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sizedObject.height * 0.02,
                    ),
                    const TitleText(titleText: 'First Name'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Input should be atleast 3 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'First Name',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 15)),
                      onSaved: (String? value) {
                        fname = value!;
                      },
                    ),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    const TitleText(titleText: 'Last Name'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Input should be atleast 3 characters';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          lname = value!;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Last Name',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    const TitleText(titleText: 'User Name'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                        onSaved: (String? value) {
                          username = value!;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'Input should be atleast 2 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'User Name',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    const TitleText(titleText: 'Email'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                        onSaved: (String? value) {
                          email = value!;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              value.length < 10) {
                            return 'Invalid input';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    const TitleText(titleText: 'Password'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                        controller: passwordController,
                        onSaved: (String? value) {
                          password = value!;
                        },
                        validator: (String? value) {
                          if (value!.length < 5 || value.isEmpty) {
                            return 'Password must be atleast 5 characters';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: _obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    const TitleText(titleText: 'Confirm Password'),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                    TextFormField(
                        validator: (String? value) {
                          if (passwordController.text != value) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: _cpobscureText,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _cpobscureText = !_cpobscureText;
                                  });
                                },
                                icon: _cpobscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Confirm Password',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15))),
                    SizedBox(
                      height: sizedObject.height * 0.01,
                    ),
                  ],
                )),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            SizedBox(
              width: sizedObject.width * 0.7,
              height: sizedObject.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  submitSignUpData();
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
              height: sizedObject.height * 0.03,
            ),
            BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SignUpLoaded) {
                  final username = state.userData.userName;
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signup Successful $username')));
                  context.go('/login');
                }
                if (state is SignUpError) {
                  final message = state.errorMessage;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                }
              },
              child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                if (state is SignUpLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox();
              }),
            ),
            SizedBox(
              height: sizedObject.height * 0.01,
            ),
            ElevatedButtonCustomized(
              btnText: 'Connect with Facebook',
              func: () {},
              imagePath: 'assets/fb.png',
            ),
            SizedBox(
              height: sizedObject.height * 0.02,
            ),
            ElevatedButtonCustomized(
              btnText: 'Connect with Google',
              func: () {},
              imagePath: 'assets/google.png',
            ),
          ],
        ),
      ),
    );
  }
}
