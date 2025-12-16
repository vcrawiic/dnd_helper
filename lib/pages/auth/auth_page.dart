import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/auth/auth_cubit.dart';
import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:dnd_helper/utils/validators.dart';
import 'package:dnd_helper/widgets/custom_segmented_control.dart';
import 'package:dnd_helper/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthMode { signIn, signUp }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.signIn;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryBG,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Pallete.primary,
              ),
            );
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomSegmentedControl<AuthMode>(
                        selectedColor: Pallete.primary,
                        unselectedColor: Pallete.primaryBG,
                        borderColor: Pallete.primary,
                        borderRadius: 8,
                        borderWidth: 2,
                        groupValue: _authMode,
                        onValueChanged: (AuthMode value) {
                          setState(() {
                            _authMode = value;
                            _emailController.clear();
                            _passwordController.clear();
                          });
                        },
                        children: const {
                          AuthMode.signIn: Text('Sign In'),
                          AuthMode.signUp: Text('Sign Up'),
                        },
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.email,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        validator: Validators.password,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => _handleSubmit(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallete.primary,
                          overlayColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          _authMode == AuthMode.signIn ? 'Sign In' : 'Sign Up',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Pallete.primaryBG,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      if (_authMode == AuthMode.signIn) {
        context.read<AuthCubit>().signIn(
          _emailController.text.trim(),
          _passwordController.text,
        );
      } else {
        context.read<AuthCubit>().signUp(
          _emailController.text.trim(),
          _passwordController.text,
        );
      }
    } 
  }
}
