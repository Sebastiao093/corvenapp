import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool _isSwitchActive = false;

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isSwitchActive {
    return _isSwitchActive;
  }

  set isSwitchActive(bool value) {
    _isSwitchActive = value;
    notifyListeners();
  }

  bool isValidForm(){

    print(formKey.currentState?.validate());

    print('$email - $password');


    return formKey.currentState?.validate() ?? false;

  }
  
}