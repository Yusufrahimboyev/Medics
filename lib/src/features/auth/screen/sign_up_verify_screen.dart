import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/auth/bloc/sign_up_verify/sign_up_verify_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../common/style/app_icons.dart';

class SignUpVerifyScreen extends StatefulWidget {
  final String email;

  const SignUpVerifyScreen({super.key, required this.email});

  @override
  State<SignUpVerifyScreen> createState() => _SignUpVerifyScreenState();
}

class _SignUpVerifyScreenState extends State<SignUpVerifyScreen> {
  final TextEditingController controller = TextEditingController();
   bool borderPin = true;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 70,
      height: 70,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      textStyle: context.textTheme.bodyLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: context.colors.primary,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.colors.onPrimaryContainer),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(

      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(AppIcons.backButton),
        ),
      ),
      body: BlocBuilder<SignUpVerifyBloc, SignUpVerifyState>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    context.lang.verificationCode,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.colors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                context.lang.emailVerification,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: context.colors.onPrimaryFixedVariant,
                ),
              ),
              Row(
                children: [
                  Text(
                    context.lang.emailVerification2,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: context.colors.onPrimaryFixedVariant,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.email,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: context.colors.primary.withOpacity(0.8),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Pinput widget for verification code input
              Pinput(
                controller: controller,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: PinTheme(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  textStyle: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: context.colors.primary,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: !state.status.isError ? context.colors.onPrimaryContainer : context.colors.error),
                  ),
                ),
                keyboardType: TextInputType.number,
                onCompleted: (pin) {
                  context.read<SignUpVerifyBloc>().add(
                    Verify$SignUpVerifyEvent(
                      email: widget.email,
                      context: context,
                      code: controller.text.trim(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SignUpVerifyBloc>().add(
                          Verify$SignUpVerifyEvent(
                            email: widget.email,
                            context: context,
                            code: controller.text.trim(),
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.onPrimaryContainer,
                    fixedSize: const Size(350, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    context.lang.Verify,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: context.colors.onPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.lang.receive_code,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.colors.secondaryFixed,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      // Resend the verification code
                      print("Resend Verification Code");
                    },
                    child: Text(
                      context.lang.Resend,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.colors.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
