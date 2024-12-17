import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:medics/src/common/utils/context_extension.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  late final TextEditingController _cardNumberController;

  late final TextEditingController _expiryDateController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final MaskTextInputFormatter _cardNumberFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final MaskTextInputFormatter _expiryDateFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    _cardNumberController = TextEditingController();
    _expiryDateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const CupertinoNavigationBarBackButton(),
        centerTitle: true,
        title: Text(
          context.lang.add_card,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: context.colors.secondary,
                ),
                child: SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.onPrimaryFixed,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _cardNumberController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(19),
                                      _cardNumberFormatter
                                    ],
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: context.lang.card_number,
                                      hintStyle: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: context
                                            .colors.onPrimaryFixedVariant,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Card number cannot be empty';
                                      }
                                      if (!_cardNumberFormatter.isFill()) {
                                        return 'Please enter a valid card number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Icon(Icons.credit_card,
                                    color: context.colors.primary),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 66,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.onPrimaryFixed,
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextFormField(
                                controller: _expiryDateController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: context.lang.mmyy,
                                  hintStyle:
                                      context.textTheme.bodyMedium?.copyWith(
                                    color: context.colors.onPrimaryFixedVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [_expiryDateFormatter],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Expiry date cannot be empty';
                                  }
                                  if (!_expiryDateFormatter.isFill()) {
                                    return 'Please enter a valid expiry date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateColor.transparent,
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    backgroundColor:
                        WidgetStatePropertyAll(context.colors.primary),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      context.pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.lang.add_card,
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
