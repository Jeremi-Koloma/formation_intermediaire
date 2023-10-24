import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = "";
  var pwd = "";
  var showEye = false.obs;
  var remember = false.obs;

  var isRegister = true.obs;

  final formKey = GlobalKey<FormState>();

  // Pour la validation du formulaire Register
  bool validateRegisterForm() {
    var isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
    }
    return isValid;
  }

  // Pour la validation de username
  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return "Le nom d'utilisateur est requis !";
    }
    if (value.length < 4) {
      return "04 caractères minimuim !";
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
}
