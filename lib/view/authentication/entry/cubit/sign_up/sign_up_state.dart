part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  SignUpState({
    @required this.currentStep,
  });

  final int currentStep;

  @override
  List<Object> get props => [
        this.currentStep,
      ];
}
