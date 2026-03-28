// lib/features/auth/presentation/auth_screen.dart
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('acost app'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Register'),
            ],
          ),
        ),
        body: const TabBarView(children: [_LoginForm(), _RegisterForm()]),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return const _AuthForm(fields: ['Email', 'Password'], buttonText: 'Login');
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return const _AuthForm(
      fields: ['Name', 'Email', 'Password'],
      buttonText: 'Register',
    );
  }
}

class _AuthForm extends StatelessWidget {
  final List<String> fields;
  final String buttonText;

  const _AuthForm({required this.fields, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          for (final f in fields) ...[
            TextField(
              obscureText: f == 'Password',
              decoration: InputDecoration(labelText: f),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 8),
          FilledButton(onPressed: () {}, child: Text(buttonText)),
        ],
      ),
    );
  }
}
