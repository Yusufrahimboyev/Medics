import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/constants/constants.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import '../../../common/router/app_router.dart';
import '../../../common/style/app_icons.dart';
import '../bloc/sign_up/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
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

  String? nameValidator(String? value) => switch (value) {
        String a when a.isEmpty => context.lang.enter_name,
        _ => null,
      };

  bool isNameFilled = false;
  bool isEmailFilled = false;
  bool isPasswordFilled = false;
  bool isChecked = false;
  bool vision = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {
        isNameFilled = nameController.text.isNotEmpty;
      });
    });
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
        backgroundColor: context.colors.onPrimary,
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
            context.lang.Sign_Up,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: context.colors.primary,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: nameValidator,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isNameFilled
                          ? context.colors.onPrimaryFixed.withOpacity(0.3)
                          : context.colors.onPrimaryFixed.withOpacity(0.3),
                      prefixIcon: Icon(
                        isNameFilled ? Icons.person : Icons.person,
                        color: isNameFilled ? Colors.green : Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: isNameFilled
                              ? context.colors.onPrimary
                              : context.colors.onPrimaryFixed
                                  .withOpacity(0.3), // Dynamic border color
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: context.colors.secondaryFixed.withOpacity(0.3),
                          width: 2.0,
                        ),
                      ),
                      hintText: context.lang.Enter_name,
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
                                  .withOpacity(0.3), // Dynamic border color
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: context.colors.secondaryFixed.withOpacity(0.3),
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
                              : context.colors.onPrimaryFixed.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: context.colors.secondaryFixed.withOpacity(0.3),
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
                  Row(
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            side: WidgetStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                color: context.colors.tertiaryContainer,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        child: Checkbox(
                          value: isChecked,
                          activeColor: Colors.white,
                          checkColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          context.lang.I_agree_medidoc_Policy,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.colors.onSecondaryFixedVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.dependencies.shp.setString(
                          Constants.userName,
                          nameController.text.trim(),
                        );
                        context.read<AuthBloc>().add(
                              SignUp$AuthEvent(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                context: context,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 60),
                      backgroundColor: const Color(0xFF4E9A88),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    child: state.status.isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            context.lang.Sign_Up,
                            style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.colors.onPrimary),
                          ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.lang.Dont_account,
                        style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.colors.secondaryFixed),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(AppRouter.logIn);
                        },
                        child: Text(
                          context.lang.Sign_Up,
                          style: context.textTheme.titleMedium?.copyWith(
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
        }),
      ),
    );
  }
}
