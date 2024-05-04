import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mlosafi/common/reusables/title_text.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final sizedObject = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            child: Center(
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(titleText: 'Reset Link'),
            SizedBox(
              height: sizedObject.height * 0.02,
            ),
            const Text(
                'Enter yor email address and we will send you the reset link.'),
            SizedBox(
              height: sizedObject.height * 0.02,
            ),
            const TitleText(titleText: 'Email address'),
            SizedBox(
              height: sizedObject.height * 0.02,
            ),
            //Use a controller since it is only a single input
            TextField(
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
              height: sizedObject.height * 0.03,
            ),
            SizedBox(
              width: sizedObject.width,
              height: sizedObject.height * 0.05,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('RESET PASSWORD'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
