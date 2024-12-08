import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
  final RegExp emailRegExp = RegExp("^[a-zA-Z]+[0-9]*[a-zA-Z]*@[a-z]+\.[a-zA-Z]+");
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isNameFilled
                          ? context.colors.onPrimaryFixed.withOpacity(0.3)
                          : context.colors.onPrimaryFixed.withOpacity(0.3),
                      prefixIcon: Icon(
                        isNameFilled
                            ? Icons.person
                            : Icons.person,
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
                            fontSize: 11,
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
                      context.read<AuthBloc>().add(
                            SignUp$AuthEvent(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              context: context,
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 60),
                      backgroundColor: const Color(0xFF4E9A88),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
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
                        style: context.textTheme.headlineSmall?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: context.colors.secondaryFixed),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          context.push(AppRouter.logIn);
                        },
                        child: Text(
                          context.lang.Sign_Up,
                          style: context.textTheme.headlineSmall?.copyWith(
                              fontSize: 17,
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

class SuccessWidget extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const SuccessWidget({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: context.colors.onPrimaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: SvgPicture.asset(
                    AppIcons.doneDialog,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  message,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: context.colors.onPrimaryFixedVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(220, 65),
                  backgroundColor: context.colors.onPrimaryContainer,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 50,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  buttonText,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
