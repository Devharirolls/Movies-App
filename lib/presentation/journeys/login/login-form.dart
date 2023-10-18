import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/presentation/blocs/login/login_cubit.dart';
import 'package:jokermovies/presentation/journeys/home/home_screen.dart';
import 'package:jokermovies/presentation/journeys/login/login_field_widget.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';
import 'package:jokermovies/presentation/widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _userNameController, _passswordcontroller;
  bool enableSignIn = false;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passswordcontroller = TextEditingController();

    _userNameController.addListener(() {
      setState(() {
        enableSignIn = (_userNameController.text.isNotEmpty) &&
            (_passswordcontroller.text.isNotEmpty);
      });
    });
    _passswordcontroller.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passswordcontroller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.clear();
    _passswordcontroller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_32.w.toDouble(),
            vertical: Sizes.dimen_24.h.toDouble()),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_8.h.toDouble()),
              child: Text(
                TranslationConstants.loginToMovieApp.t(context)!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            LabelFieldWidget(
              label: TranslationConstants.username.t(context)!,
              hintText: TranslationConstants.enterTMDbUsername.t(context)!,
              controller: _userNameController,
              textFieldKey: const ValueKey('username_text_field_key'),
            ),
            LabelFieldWidget(
              label: TranslationConstants.password.t(context)!,
              hintText: TranslationConstants.enterPassword,
              controller: _passswordcontroller,
              isPasswordField: true,
              textFieldKey: const ValueKey('password_text_field_key'),
            ),
            BlocConsumer<LoginCubit, LoginState>(
              buildWhen: (previous, current) => current is LoginError,
              builder: (context, state) {
                if (state is LoginError)
                  return Text(
                    state.message.t(context)!,
                    style: Theme.of(context)
                        .textTheme
                        .orangeSubtitle1!
                        .copyWith(color: Colors.orange),
                  );
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteList.home,
                  (route) => false,
                );
              },
            ),
            Button(
              text: TranslationConstants.signIn,
              onPressed: () => enableSignIn
                  ? BlocProvider.of<LoginCubit>(context).initiateLogin(
                      _userNameController.text,
                      _passswordcontroller.text,
                    )
                  : null,
              // BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent(_userNameController.text, _passswordcontroller.text)):null,
              isEnabled: enableSignIn,
            ),
             Button(
              onPressed: () =>
                  BlocProvider.of<LoginCubit>(context).initiateGuestLogin(),
              text: TranslationConstants.guestSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
// }


 

