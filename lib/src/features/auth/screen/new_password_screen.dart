import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import '../../../common/style/app_icons.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordFilled = false;
  bool isPasswordFilled = false;
  bool vision = false;
  bool vision2 = false;

  @override
  void initState() {
    super.initState();
    confirmPasswordController.addListener(() {
      setState(() {
        isConfirmPasswordFilled = confirmPasswordController.text.isNotEmpty;
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
    return Scaffold(
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
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  context.lang.Create_new_Password,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  context.lang.Create_new_password,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                      color: context.colors.onPrimaryFixedVariant
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              validator: (a){
                if(a == ''){
                  return context.lang.wrong_password;
                }
                return null;
              },
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
                    color: isPasswordFilled ? context.colors.onPrimary : context.colors.onPrimaryFixed.withOpacity(0.3),
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
            const SizedBox(height: 15),
            // Password TextField
            TextFormField(
              validator: (a){
                if(a == ''){
                  return context.lang.wrong_password;
                }
                return null;
              },
              controller: confirmPasswordController,
              obscureText: vision2,
              decoration: InputDecoration(
                filled: true,
                fillColor: isConfirmPasswordFilled ? context.colors.onPrimaryFixed.withOpacity(0.3) : context.colors.onPrimaryFixed.withOpacity(0.3),
                prefixIcon: Icon(
                  isConfirmPasswordFilled ? Icons.lock : Icons.lock,
                  color: isConfirmPasswordFilled ? Colors.green : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(
                    color: isConfirmPasswordFilled ? context.colors.onPrimary : context.colors.onPrimaryFixed.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide:  BorderSide(
                    color: context.colors.secondaryFixed.withOpacity(0.3),
                    width: 2.0,
                  ),),
                hintText: context.lang.Confirm_password,
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
                      vision2 = !vision2;
                    });
                  },
                  icon: Icon(
                    vision2 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFFADADAD),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessWidget(
                    title: context.lang.Success,
                    message: context.lang.successfully_registered,
                    buttonText: context.lang.Login,
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
              child: Text(context.lang.Create_Password,
                  style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: context.colors.onPrimary)),
            ),
          ],
        ),
      ),
    );  }
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
    return Container(
      height: 400,
      width: 350,
      color: Colors.transparent,
      child: Dialog(
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
