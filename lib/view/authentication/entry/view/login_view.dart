import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/view/authentication/entry/model/user_model.dart';
import 'package:food_delivery/view/authentication/entry/service/entry_service.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../product/widgets/button/elevated_text_button.dart';
import '../../../../product/widgets/text/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  LoginView({
    Key key,
  }) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowSymetric,
      child: Column(
        children: [
          Spacer(flex: 3),
          Expanded(flex: 10, child: buildLoginForm),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: Text(
                  'Forgot passcode?',
                  style: context.currentTheme.textTheme.subtitle1,
                ),
                onTap: () {},
              ),
            ),
          ),
          Spacer(flex: 6),
          ElevatedTextButton(
            onPressed: () async {
              EntryService.instance.login(UserModel.login(
                  email: 'halilakkaynak71@gmail.com', password: 'Password1*'));
            },
            text: 'Login',
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }

  Form get buildLoginForm => Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingLowBottom,
            child: Column(
              children: [
                buildEmailTextFormFieldOnLogin,
                SizedBox(
                  height: context.customHeigthValue(0.02),
                ),
                buildPasswordTextFormFieldOnLogin,
              ],
            ),
          ),
        ),
      );

  CustomTextFormField get buildEmailTextFormFieldOnLogin => CustomTextFormField(
        textInputType: TextInputType.emailAddress,
        textController: _emailTextController,
        hintText: 'Enter email adress',
        labelText: 'Email adress',
        validator: _emailValidator,
      );

  CustomTextFormField get buildPasswordTextFormFieldOnLogin =>
      CustomTextFormField(
        obcureText: true,
        textController: _passwordTextController,
        hintText: 'Enter password',
        labelText: 'Password',
        suffix: InkWell(
          onTap: () {},
          child: Icon(Icons.visibility_outlined),
        ),
        validator: _passwordValidator,
      );

  String _emailValidator(String value) {
    return value.isEmpty ? 'mha' : null;
  }

  String _passwordValidator(String value) {
    return value.isEmpty ? 'mha' : null;
  }
}
