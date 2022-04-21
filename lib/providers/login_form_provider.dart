import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool _isSaving = false;

  bool get isSaving => _isSaving;

  set isSaving(bool value) {
    _isSaving = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKeyLogin.currentState?.validate() ?? false;
  }
}