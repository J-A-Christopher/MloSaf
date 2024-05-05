import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/elevated_button.dart';
import 'package:mlosafi/common/reusables/title_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            ?.copyWith(fontSize: 15))),
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
                  context.go('/first-route');
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
