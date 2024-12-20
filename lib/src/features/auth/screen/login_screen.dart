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
        body: BlocBuilder<LogInBloc,LogInState>(builder: (context, state){
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
                      fillColor: isEmailFilled ? context.colors.onPrimaryFixed.withOpacity(0.3) : context.colors.onPrimaryFixed.withOpacity(0.3),
                      prefixIcon: Icon(
                        isEmailFilled ?  Icons.local_post_office_rounded: Icons.local_post_office_rounded,
                        color: isEmailFilled ? Colors.green : Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: isEmailFilled ? context.colors.onPrimary : context.colors.onPrimaryFixed.withOpacity(0.3), // Dynamic border color
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:  BorderSide(
                          color: context.colors.secondaryFixed.withOpacity(0.3),
                          width: 2.0,
                        ),),
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
                      fillColor: isPasswordFilled ? context.colors.onPrimaryFixed.withOpacity(0.3) : context.colors.onPrimaryFixed.withOpacity(0.3),
                      prefixIcon: Icon(
                        isPasswordFilled ? Icons.lock : Icons.lock,
                        color: isPasswordFilled ? Colors.green : Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: isPasswordFilled ? context.colors.onPrimary : context.colors.onPrimaryFixed.withOpacity(0.3), // Dynamic border color
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:  BorderSide(
                          color: context.colors.secondaryFixed.withOpacity(0.3),
                          width: 2.0,
                        ),),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.go(AppRouter.resetEp);
                        },
                        child:  Text(
                            context.lang.Forgot_Password,
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.colors.onPrimaryContainer
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState?.validate() ?? false){
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
                        : Text(
                        context.lang.Login,
                        style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colors.onPrimary
                        )
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.lang.Dont_account,
                        style: context.textTheme.headlineSmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: context.colors.secondaryFixed),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: (){
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
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(context.lang.or,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: context.colors.primary),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.google),
                      label: Text(
                        context.lang.Sign_Google,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:  BorderSide(color: context.colors.onTertiary, width: 2),
                        ),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.apple),
                      label: Text(
                        context.lang.Sign_Apple,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:  BorderSide(color: context.colors.onTertiary, width: 2), // Qora border
                        ),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.facebook),
                      label: Text(
                        context.lang.Sign_Facebook,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:  BorderSide(color: context.colors.onTertiary, width: 2),
                        ),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                    ),
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
                child:  Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: SvgPicture.asset(AppIcons.doneDialog,),
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
                  ),),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}



