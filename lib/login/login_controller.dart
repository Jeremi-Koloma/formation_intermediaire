import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = "";
  var pwd = "";
  var showEye = false.obs;
  var remember = false.obs;

  var isLogIn = true.obs;

  final formKey = GlobalKey<FormState>();

  // Pour la validation du formulaire Register
  bool validateLoginForm() {
    var isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
    }
    return isValid;
  }

  // Pour la validation des mots de passe
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Le mot de passe est requis !";
    }

    if (value.length < 6) {
      return "Le mot de passe est faible !";
    }

    return null;
  }

  // Pour la validation d'email
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "L'email est requis !";
    }
    if (!value.isEmail) {
      return "L'adresse email n'est pas valide";
    }

    return null;
  }

  // une méthode pour enregister l'email
  void saveEmail(String? newValue) {
    email = newValue!;
  }

  // une méthode pour enregister le mots de passe
  void savePassword(String? newValue) {
    pwd = newValue!;
  }
}
