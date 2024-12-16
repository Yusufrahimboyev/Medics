import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/auth/bloc/log_in/log_in_bloc.dart';
import '../../../common/style/app_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RegExp emailRegExp =
      RegExp("^[a-zA-Z]+[0-9]*[a-zA-Z]*@[a-z]+\.[a-zA-Z]+");
  final RegExp passwordRegExp = RegExp(r"(\w){8,}");

  final formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) => switch (value) {
        String a when !a.contains(emailRegExp) =>
          context.lang.email_entered_wrong,
        _ => null,
      };

  String? passwordValidator(String? value) => switch (value) {
        String a when !a.contains(passwordRegExp) =>
          context.lang.wrong_password,
        _ => null,
      };

  bool isEmailFilled = false;
  bool isPasswordFilled = false;
  bool vision = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        isEmailFilled = emailController.text.isNotEmpty;
      });
    });
    passwordController.addListener(() {
      setState(() {
        isPasswordFilled = passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: context.colors.onPrimary,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset(AppIcons.backButton),
          ),
          title: Text(
            context.lang.Login,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: context.colors.primary,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: emailValidator,
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isEmailFilled
                            ? context.colors.onPrimaryFixed.withOpacity(0.3)
                            : context.colors.onPrimaryFixed.withOpacity(0.3),
                        prefixIcon: Icon(
                          isEmailFilled
                              ? Icons.local_post_office_rounded
                              : Icons.local_post_office_rounded,
                          color: isEmailFilled ? Colors.green : Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: isEmailFilled
                                ? context.colors.onPrimary
                                : context.colors.onPrimaryFixed
                                    .withOpacity(0.3),
                            // Dynamic border color
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color:
                                context.colors.secondaryFixed.withOpacity(0.3),
                            width: 2.0,
                          ),
                        ),
                        hintText: context.lang.Enter_email,
                        hintStyle: context.textTheme.bodyLarge?.copyWith(
                          color: context.colors.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Password TextField
                    TextFormField(
                      validator: passwordValidator,
                      controller: passwordController,
                      obscureText: vision,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isPasswordFilled
                            ? context.colors.onPrimaryFixed.withOpacity(0.3)
                            : context.colors.onPrimaryFixed.withOpacity(0.3),
                        prefixIcon: Icon(
                          isPasswordFilled ? Icons.lock : Icons.lock,
                          color: isPasswordFilled ? Colors.green : Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: isPasswordFilled
                                ? context.colors.onPrimary
                                : context.colors.onPrimaryFixed
                                    .withOpacity(0.3),
                            // Dynamic border color
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color:
                                context.colors.secondaryFixed.withOpacity(0.3),
                            width: 2.0,
                          ),
                        ),
                        hintText: context.lang.Enter_password,
                        hintStyle: context.textTheme.bodyLarge?.copyWith(
                          color: context.colors.secondary,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              vision = !vision;
                            });
                          },
                          icon: Icon(
                            vision ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xFFADADAD),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          overlayColor: WidgetStateColor.transparent,
                          onTap: () {
                            context.push(AppRouter.resetEp);
                          },
                          child: Text(context.lang.Forgot_Password,
                              style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.onPrimaryContainer)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false){
                          context.read<LogInBloc>().add(
                                LogIn$LogInEvent(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  context: context,
                                ),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: const Color(0xFF4E9A88),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: state.status.isLoading
                          ? const CircularProgressIndicator()
                          : Text(context.lang.Login,
                              style: context.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.onPrimary)),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.lang.Dont_account,
                          style: context.textTheme.headlineSmall?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: context.colors.secondaryFixed),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("1");
                            context.push(AppRouter.signUp);
                          },
                          child: Text(
                            context.lang.Sign_Up,
                            style: context.textTheme.headlineSmall?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: context.colors.onPrimaryContainer),
                          ),
                        ),
                      ],
                    ),




                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
