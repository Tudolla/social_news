import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_new/core/common/loader.dart';
import 'package:reddit_new/core/common/sign_in_button.dart';
import 'package:reddit_new/features/auth/controller/auth_controller.dart';

import '../../../core/constants/constants.dart';

// ConsumerWidget cho phep ref tuong tac voi Provider
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 50,
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Skipp')),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome to my world',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Constants.loginEmoPath,
                    height: 400,
                  ),
                ),
                const SignInButton(),
              ],
            ),
    );
  }
}
