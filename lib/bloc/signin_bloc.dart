import 'package:blocwithvalidation/bloc/signin_event.dart';
import 'package:blocwithvalidation/bloc/signin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailValue == '' &&
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please Enter a valid Email Address"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please Enter a Valid password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignLoadingState());
    });
  }
}
