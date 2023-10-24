import 'package:flutter/material.dart';
import 'package:formation_intermediaire/login/login_page.dart';
import 'package:formation_intermediaire/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = RegisterController();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            // Pour rendre scrollable
            child: Form(
              // Pour la validation
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 56),
                  Text(
                    "Sign Up",
                    style: textTheme.displaySmall,
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          const AssetImage("assets/logo/orange.png"),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.photo_camera_outlined),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Username"),
                    validator: controller.validateUsername,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: controller.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormField(
                      validator: controller.validatePassword,
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
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextFormField(
                      validator: controller.validatePassword,
                      obscureText: !controller.showEye.value,
                      decoration: InputDecoration(
                        labelText: "Repeat Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.showEye.toggle();
                            },
                            icon: controller.showEye.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                      ),
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
                          if (controller.validateRegisterForm()) {
                            Get.to(() => const LoginPage());
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Already have account ? Login.")),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
