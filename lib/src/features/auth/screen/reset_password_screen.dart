import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/auth/bloc/password_verify/password_verify_bloc.dart';
import 'package:medics/src/features/auth/bloc/reset_password/reset_pass_bloc.dart';
import '../../../common/style/app_icons.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isEmailFilled = false;
  final RegExp emailRegExp = RegExp("^[a-zA-Z]+[0-9]*[a-zA-Z]*@[a-z]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) => switch (value) {
    String a when !a.contains(emailRegExp) =>
    context.lang.email_entered_wrong,
    _ => null,
  };
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        isEmailFilled = emailController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset(AppIcons.backButton),
          ),
        ),
        body: BlocBuilder<ResetPassBloc,ResetPassState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      context.lang.Forgot_Your_Password,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  context.lang.email_confirmation,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: context.colors.onPrimaryFixedVariant),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    context.read<ResetPassBloc>().add(
                      ResetPass$ResetPassEvent(
                        context: context,
                        email: emailController.text.trim(),
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
                  child: Text(context.lang.reset_password_button,
                      style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: context.colors.onPrimary)),
                ),
              ],
            ),
          );}
        )
      ),
    );
  }
}

