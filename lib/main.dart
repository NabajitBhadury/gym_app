import 'package:fitness/auth/firebase_auth_provider.dart';
import 'package:fitness/bloc/auth_bloc.dart';
import 'package:fitness/bloc/auth_event.dart';
import 'package:fitness/bloc/auth_state.dart';
import 'package:fitness/loading_screen.dart';
import 'package:fitness/view/login/forgot_password_view.dart';
import 'package:fitness/view/login/login_view.dart';
import 'package:fitness/view/login/signup_view.dart';
import 'package:fitness/view/login/verify_email_view.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:fitness/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/colo_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness 3 in 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: TColor.primaryColor1,
          fontFamily: "Poppins"),
      // home: const MainTabView(),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          FirebaseAuthProvider(),
        ),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.isLoading) {
        LoadingScreen().show(
          context: context,
          text: state.loadingText ?? 'Please wait a moment',
        );
      } else {
        LoadingScreen().hide();
      }
    }, builder: (context, state) {
      if (state is AuthStateOnboarding) {
        return const OnBoardingView();
      } else if (state is AuthStateOnboardingComplete) {
        return const LoginView();
      } else if (state is AuthStateLoggedIn) {
        return const MainTabView();
      } else if (state is AuthStateNeedsVerification) {
        return const VerifyEmailView();
      } else if (state is AuthStateLoggedOut) {
        return const LoginView();
      } else if (state is AuthStateForgotPassword) {
        return const ForgotPasswordView();
      } else if (state is AuthStateRegistering) {
        return const SignUpView();
      } else {
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      }
    });
  }
}
