import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/auth/auth_cubit.dart';
import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:dnd_helper/utils/validators.dart';
import 'package:dnd_helper/pages/auth/widgets/custom_segmented_control.dart';
import 'package:dnd_helper/widgets/custom_text_field.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
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
      extendBody: true,
      backgroundColor: Pallete.primaryBG.withAlpha(60),
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
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/forest.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(decoration: BoxDecoration(color: Pallete.primary.withAlpha(60)),
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: LiquidContainer(
                      radius: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Pallete.primaryBG.withAlpha(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                LiquidContainer(
                                  radius: 8,
                                  child: CustomSegmentedControl<AuthMode>(
                                    selectedColor: Pallete.primaryAlpha200,
                                    unselectedColor: Pallete.primaryBGAlpha200,
                                    borderColor: Pallete.primary,
                                    borderRadius: 8,
                                    borderWidth: 0,
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
                                ),
                                const SizedBox(height: 32),
                                LiquidContainer(radius: 12,
                                  child: CustomTextField(
                                    controller: _emailController,
                                    labelText: 'Email',
                                    prefixIcon: Icons.email,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: Validators.email,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                LiquidContainer(radius: 12,
                                  child: CustomTextField(
                                    controller: _passwordController,
                                    labelText: 'Password',
                                    prefixIcon: Icons.lock,
                                    obscureText: true,
                                    validator: Validators.password,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                LiquidContainer(radius: 8,
                                  child: ElevatedButton(
                                    onPressed: () => _handleSubmit(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallete.primaryAlpha200,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      _authMode == AuthMode.signIn
                                          ? 'Sign In'
                                          : 'Sign Up',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Pallete.primaryWhiteText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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