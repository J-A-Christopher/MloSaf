import 'package:flutter/material.dart';
import 'package:mlosafi/common/reusables/elevated_button.dart';
import 'package:mlosafi/common/reusables/title_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                            ?.copyWith(fontSize: 15))),
                SizedBox(
                  height: sizedObject.height * 0.01,
                ),
                const TitleText(titleText: 'Last Name'),
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
                const TitleText(titleText: 'Confirm Password'),
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
                onPressed: () {},
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
