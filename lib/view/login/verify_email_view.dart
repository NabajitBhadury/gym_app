import 'package:fitness/auth/auth_service.dart';
import 'package:fitness/bloc/auth_bloc.dart';
import 'package:fitness/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Click to resend email'),
            ElevatedButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(
                        const AuthEventSendEmailVerification(),
                      );
                },
                child: const Text('Resend Email')),
            ElevatedButton(
                onPressed: () async {
                  await AuthService.firebase().logout();
                  context.read<AuthBloc>().add(const AuthEventLogout());
                },
                child: const Text('Back to home Screen')),
          ],
        ),
      ),
    );
  }
}
