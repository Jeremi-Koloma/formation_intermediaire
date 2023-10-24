import 'package:flutter/material.dart';
import 'package:formation_intermediaire/chats/chats_page.dart';
import 'package:formation_intermediaire/login/login_controller.dart';
import 'package:formation_intermediaire/register/register_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = LoginController();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 56),
              Text(
                "Sign In",
                style: textTheme.displaySmall,
              ),
              const SizedBox(height: 100),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email"),
                validator: controller.validateEmail,
                onSaved: controller.saveEmail,
              ),
              const SizedBox(height: 16),
              Obx(
                () => TextFormField(
                  obscureText: !controller.showEye.value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.showEye.toggle();
                        },
                        icon: controller.showEye.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                  validator: controller.validatePassword,
                  onSaved: controller.savePassword,
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                  onPressed: () {
                    controller.remember.toggle();
                  },
                  icon: Obx(() => controller.remember.value
                      ? const Icon(Icons.check_box_outlined)
                      : const Icon(Icons.check_box_outline_blank)),
                  label: const Text("Remember")),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          if (controller.validateLoginForm()) {
                            Get.offAll(() => const ChatsPage());
                          }
                        },
                        child: const Text("Sign In"))),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                    onPressed: () {
                      Get.to(() => const RegisterPage());
                    },
                    child: const Text("No account ? Register.")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
