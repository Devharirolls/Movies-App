import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/presentation/journeys/login/login-form.dart';
import 'package:jokermovies/presentation/widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_32.h.toDouble()),
              child: Logo(height: Sizes.dimen_12.h.toDouble()),
            ),
            const Expanded(
              child: LoginForm(
                key: ValueKey('login_form_key'),
              ))
          ],
        ),
      ),
    );
  }
}