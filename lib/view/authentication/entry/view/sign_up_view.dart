import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/widgets/text/custom_text_form_field.dart';
import '../cubit/sign_up/sign_up_cubit.dart';
import '../model/user_model.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _nameTextController = TextEditingController();
  final _surnameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordTextController2 = TextEditingController();
  final _addressTextController = TextEditingController();
  final _phoneNumTextController = TextEditingController();
  var _isNameStepActive = false;
  var _isEmailStepActive = false;
  var _isPasswordStepActive = false;
  var _isContactInformationStepActive = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Stepper(
            type: StepperType.vertical,
            currentStep: state.currentStep,
            physics: ScrollPhysics(),
            onStepTapped: context.read<SignUpCubit>().tapped,
            onStepContinue: () {
              if (state.currentStep <= 2) {
                context.read<SignUpCubit>().increaseCurrentStep();
              } else {
                _signUp();
              }
            },
            onStepCancel: context.read<SignUpCubit>().decreaseCurrentStep,
            steps: <Step>[
              Step(
                title: Text('Name'),
                content: _buildNameTextFormColumn(),
                isActive: _isNameStepActive,
                state: state.currentStep >= 1
                    ? StepState.editing
                    : StepState.disabled,
              ),
              Step(
                title: Text('Email'),
                content: _buildEmailTextForm(),
                isActive: _isEmailStepActive,
                state: state.currentStep >= 2
                    ? StepState.editing
                    : StepState.disabled,
              ),
              Step(
                title: Text('Password'),
                content: _buildPasswordColumn(),
                isActive: _isPasswordStepActive,
                state: state.currentStep >= 3
                    ? StepState.editing
                    : StepState.disabled,
              ),
              Step(
                title: Text('Contact Information'),
                content: _buildContactInformationColumn(),
                isActive: _isContactInformationStepActive,
                state: state.currentStep >= 3
                    ? StepState.editing
                    : StepState.disabled,
              ),
            ],
          );
        },
      ),
    );
  }

  Column _buildNameTextFormColumn() => Column(
        children: [
          CustomTextFormField(
            textCapitalization: TextCapitalization.sentences,
            textController: _nameTextController,
            hintText: 'Enter your name',
            labelText: 'Name',
            validator: _nameValidator,
          ),
          CustomTextFormField(
            textCapitalization: TextCapitalization.sentences,
            textController: _surnameTextController,
            hintText: 'Enter your surname',
            labelText: 'Surname',
            validator: _nameValidator,
          ),
        ],
      );

  CustomTextFormField _buildEmailTextForm() => CustomTextFormField(
        textInputType: TextInputType.emailAddress,
        textController: _emailTextController,
        hintText: 'Enter your email',
        labelText: 'Email',
        validator: _emailValidator,
      );

  Column _buildPasswordColumn() => Column(
        children: [
          _buildPasswordTextForm(_passwordTextController),
          _buildPasswordTextForm(_passwordTextController2),
        ],
      );

  CustomTextFormField _buildPasswordTextForm(
          TextEditingController textController) =>
      CustomTextFormField(
        obcureText: true,
        textController: textController,
        hintText: 'Enter your password',
        labelText: 'Password',
        validator: _passwordValidator,
      );
  Column _buildContactInformationColumn() => Column(
        children: [
          CustomTextFormField(
            textController: _addressTextController,
            hintText: 'Enter your adress',
            labelText: 'Adress',
            validator: _addressValidator,
          ),
          CustomTextFormField(
            textController: _phoneNumTextController,
            hintText: 'Enter your phone number',
            labelText: 'Phone',
            validator: _phoneValidator,
          ),
        ],
      );
  String _nameValidator(String value) {
    if (value.isNotEmpty) {
      if (value.length < 3) {
        return 'Your name must be more than three letters.';
      } else {
        _isNameStepActive = context.read<SignUpCubit>().setStepActive(0);
        return null;
      }
    } else {
      return 'You can\'t leave this blank.';
    }
  }

  String _emailValidator(String value) {
    if (value.isNotEmpty) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return 'Email not completed.';
      } else {
        _isEmailStepActive = context.read<SignUpCubit>().setStepActive(1);
        return null;
      }
    } else {
      return 'You can\'t leave this blank.';
    }
  }

  String _passwordValidator(String value) {
    if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,12}$')
        .hasMatch(value)) {
      return '\tPassword must be between 6-12 characters,\n at least one  at least '
          'none lowercase letter,\n at least one number and at least one special character.';
    } else if (_passwordTextController.text.isNotEmpty &&
        (_passwordTextController.text != _passwordTextController2.text)) {
      return '\tPasswords are not the same';
    } else if (_passwordTextController2.text.isNotEmpty) {
      _isPasswordStepActive = context.read<SignUpCubit>().setStepActive(2);
      return null;
    } else {
      return null;
    }
  }

  String _addressValidator(String value) {
    if (value.isEmpty) {
      return 'Adress cannot empty.';
    } else {
      _isContactInformationStepActive =
          context.read<SignUpCubit>().setStepActive(3);
      return null;
    }
  }

  String _phoneValidator(String value) {
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return 'Wrong phone number.';
    } else {
      _isContactInformationStepActive =
          context.read<SignUpCubit>().setStepActive(3);
      return null;
    }
  }

  Future<void> _signUp() async {
    if (_isStepsActive()) {
      final response = await context.read<SignUpCubit>().singUp(_userModel);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }

  bool _isStepsActive() {
    if (_isNameStepActive &&
        _isEmailStepActive &&
        _isPasswordStepActive &&
        _isContactInformationStepActive) {
      return true;
    } else {
      return false;
    }
  }

  UserModel get _userModel => UserModel.signUp(
      name: _nameTextController.text,
      surname: _surnameTextController.text,
      email: _emailTextController.text,
      password: _passwordTextController.text,
      address: _addressTextController.text,
      phone: _phoneNumTextController.text);
}
