import 'package:flutter/material.dart';
import 'package:twoplayercrossword/constants.dart';
import '../routes.dart';
import '../styling.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Text(
              'Login',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: kBackgroundColor
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 32),

            // Continue with Google
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.g_mobiledata, size: 26, color: kPrimaryTextColor),
                label: Text(
                  'Continue with Google',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                style: appButtonStyle,
                onPressed: () {
                  // TODO: Handle Google login
                },
              ),
            ),
            const SizedBox(height: 16),

            // Continue with Apple
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.apple, size: 22, color: kPrimaryTextColor),
                label: Text(
                  'Continue with Apple',
                  style: Theme.of(context).textTheme.labelLarge),
                style: appButtonStyle,
                onPressed: () {
                  // TODO: Handle Apple login
                },
              ),
            ),
            const SizedBox(height: 16),

            // Continue with Email
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.email_outlined, color: kPrimaryTextColor),
                label: Text(
                  'Continue with Email',
                  style: Theme.of(context).textTheme.labelLarge),
                style: appButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
              ),
            ),
            const SizedBox(height: 24),

            // Divider
            const Divider(thickness: 1),

            // Sign up link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'New user? Sign up here',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: kBackgroundColor,
                        decoration: TextDecoration.underline,
                        decorationColor: kBackgroundColor,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}