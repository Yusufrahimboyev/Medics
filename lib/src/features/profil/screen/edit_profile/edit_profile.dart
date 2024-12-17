import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medics/src/common/constants/constants.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import '../../../../common/style/app_icons.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;

  // Create a global key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _nameController.text =  context.dependencies.shp.getString(Constants.userName) ?? "";
    _phoneController.text = "";
    _emailController.text =
        context.dependencies.shp.getString(Constants.userEmail) ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        title: Text(
          context.lang.edit_profile,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.colors.primary,
                      radius: 60,
                    ),
                    Positioned(
                      top: 94,
                      left: 90,
                      child: InkWell(
                        overlayColor: WidgetStateColor.transparent,
                        onTap: () {

                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: context.colors.onSecondary,
                          child: SvgPicture.asset(
                            AppIcons.camera,
                            width: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.lang.name,
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.onPrimaryFixed,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    controller: _nameController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.lang.name,
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onPrimaryFixedVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.lang.phone,
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.onPrimaryFixed,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(

                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.none,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(19),
                      MaskTextInputFormatter(
                        mask: '+(998) ##-###-##-##',
                        filter: {"#": RegExp(r'[0-9]')},
                        type: MaskAutoCompletionType.lazy,
                      )
                    ],
                    controller: _phoneController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '+998 (00) 000-00-00',
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onPrimaryFixedVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.lang.email,
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.onPrimaryFixed,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    controller: _emailController,
                    enabled: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: _emailController.text,
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onPrimaryFixedVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        context.colors.onPrimaryContainer),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {

                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.lang.save,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colors.onPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
