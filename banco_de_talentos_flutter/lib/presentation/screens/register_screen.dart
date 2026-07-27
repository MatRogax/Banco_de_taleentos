import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/di/injection.dart';
import '../../core/utils/validators.dart';
import '../cubits/auth/auth_cubit.dart';
import '../cubits/auth/auth_state.dart';
import '../components/login_input.dart';
import '../components/animated_gradient_background.dart';
import '../components/staggered_entry_animation.dart';
import '../components/animated_primary_button.dart';
import '../../core/utils/formatters.dart';
import '../components/custom_toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _documentController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _fullNameError;
  String? _documentError;
  String? _emailError;
  String? _passwordError;

  final _cpfFormatter = CpfInputFormatter();

  @override
  void dispose() {
    _fullNameController.dispose();
    _documentController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    setState(() {
      _fullNameError = Validators.validateRequired(
          _fullNameController.text, 'Nome completo');
      _documentError = Validators.validateCPF(_documentController.text);
      _emailError = Validators.validateEmail(_emailController.text);
      _passwordError = Validators.validatePassword(_passwordController.text);
    });

    if (_fullNameError == null &&
        _documentError == null &&
        _emailError == null &&
        _passwordError == null) {
      context.read<AuthCubit>().register(
            _emailController.text.trim(),
            _passwordController.text,
            _fullNameController.text.trim(),
            _documentController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: AnimatedGradientBackground(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                CustomToast.show(
                  context,
                  message: state.message,
                  type: ToastType.error,
                );
              } else if (state is AuthAuthenticated) {
                context.go('/home');
              }
            },
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
                      child: AutofillGroup(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            StaggeredWidget(
                              index: 0,
                              child: const Text(
                                'Criar Conta',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -1,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 8),
                            StaggeredWidget(
                              index: 1,
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Junte-se a nós e impulsione sua carreira.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Form Glass Card
                            StaggeredWidget(
                              index: 2,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 30,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    LoginInput(
                                      label: 'Nome Completo',
                                      icon: Icons.person_outline,
                                      placeholder: 'Digite seu nome completo',
                                      controller: _fullNameController,
                                      autofillHints: const [AutofillHints.name],
                                      textInputAction: TextInputAction.next,
                                      errorText: _fullNameError,
                                    ),
                                    const SizedBox(height: 12),
                                    LoginInput(
                                      label: 'CPF',
                                      icon: Icons.badge_outlined,
                                      placeholder: '000.000.000-00',
                                      controller: _documentController,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      inputFormatters: [_cpfFormatter],
                                      errorText: _documentError,
                                    ),
                                    const SizedBox(height: 12),
                                    LoginInput(
                                      label: 'E-mail',
                                      icon: Icons.email_outlined,
                                      placeholder: 'exemplo@email.com',
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      textInputAction: TextInputAction.next,
                                      errorText: _emailError,
                                    ),
                                    const SizedBox(height: 12),
                                    LoginInput(
                                      label: 'Senha',
                                      icon: Icons.lock_outline,
                                      placeholder: 'Crie uma senha forte',
                                      controller: _passwordController,
                                      isPassword: true,
                                      autofillHints: const [
                                        AutofillHints.newPassword
                                      ],
                                      textInputAction: TextInputAction.done,
                                      errorText: _passwordError,
                                    ),
                                    const SizedBox(height: 16),
                                    AnimatedPrimaryButton(
                                      isLoading: state is AuthLoading,
                                      onPressed: () => _submit(context),
                                      text: 'Criar minha conta',
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const Spacer(flex: 1),
                            const SizedBox(height: 8),

                            StaggeredWidget(
                              index: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Já tem uma conta? ',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => context.pop(),
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      minimumSize: Size.zero,
                                    ),
                                    child: const Text(
                                      'Fazer Login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
