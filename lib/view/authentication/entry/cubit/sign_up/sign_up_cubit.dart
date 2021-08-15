import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/view/authentication/entry/model/user_model.dart';
import 'package:food_delivery/view/authentication/entry/service/entry_service.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState(currentStep: 0));

  void tapped(value) => emit(SignUpState(currentStep: value));

  void increaseCurrentStep() =>
      emit(SignUpState(currentStep: state.currentStep + 1));

  void decreaseCurrentStep() =>
      emit(SignUpState(currentStep: state.currentStep - 1));

  bool setStepActive(int maxCurrentStep) =>
      state.currentStep >= maxCurrentStep ? true : false;

  Future<String> singUp(UserModel user) async =>
      await EntryService.instance.signUp(user);
}
