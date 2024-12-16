import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const CupertinoNavigationBarBackButton(),
        centerTitle: true,
        title: Text(
          context.lang.faqs,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "1. What is Medic App?",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Medic App is a platform that connects patients with licensed doctors for consultations, advice, and ongoing health management. Users can schedule appointments, chat, or video call doctors to discuss their medical concerns conveniently from anywhere.",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "2.How does Medic App work?",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Medic App allows patients to register, search for a doctor based on their specialty, and book consultations. Doctors can use the app to manage appointments, consult with patients, and provide medical advice.",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w400),
                  ),
                  //
                  const SizedBox(height: 10),
                  Text(
                    "3. Who can use Medic App?",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Both patients and licensed medical professionals can use the app. Patients can seek medical advice, and doctors can offer consultations and manage patient interactions.",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w400),
                  ),
                  //
                  const SizedBox(height: 10),
                  Text(
                    "4.How do I book a consultation?",
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: context.colors.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Open the app and log in.",
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: context.colors.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Go to \"Find a Doctor.\"",
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: context.colors.primary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "Select a specialty or search for a specific doctor.",
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: context.colors.primary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "Choose your preferred time and confirm the booking.",
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
