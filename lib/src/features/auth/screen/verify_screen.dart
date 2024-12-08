import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/auth/bloc/reset_password/reset_pass_bloc.dart';
import 'package:medics/src/features/auth/bloc/sign_up_verify/sign_up_verify_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../common/style/app_icons.dart';
import '../bloc/password_verify/password_verify_bloc.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String email;

  const VerificationCodeScreen({super.key, required this.email});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController controller = TextEditingController();
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
        color: context.colors.onPrimary,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.colors.onPrimaryContainer),
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
      body: Padding(
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
                Text(
                  widget.email,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: context.colors.primary.withOpacity(0.8),
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
              submittedPinTheme: submittedPinTheme,
              keyboardType: TextInputType.number,
              onCompleted: (pin) {
                // Tasdiqlash kodi kiritilganda ishlaydi
                print("Verification Code Entered: $pin");
              },
            ),
            const SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<PasswordVerifyBloc>().add(
                    PasswordVerify$PasswordVerifyEvent(
                      context: context,
                      email: widget.email,
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
                    context.read<SignUpVerifyBloc>().add(
                      Resend$SignUpVerify(
                          context: context,
                          email: widget.email,
                      ),
                    );
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
      ),
    );
  }
}
