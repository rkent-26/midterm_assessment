import 'package:flutter/material.dart';
import 'registration_screen.dart';

const Color kViolet = Color(0xFF6D28D9);
const Color kVioletTint = Color(0xFFF3EFFC);
const Color kInk = Color(0xFF111827);
const Color kTextMuted = Color(0xFF6B7280);
const Color kBorder = Color(0xFFE5E7EB);

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const _features = ['mabilis', 'cutie', 'secured'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kViolet,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.expand,
              children: [
                //image bg
                Opacity(
                  opacity: 0.14,
                  child: Image.asset(
                    'assets/images/1204students.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                ),
                SafeArea(
                  bottom: false,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                              'assets/images/logo.PNG',
                              width: 90,
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'FillForm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: kInk,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create an account to get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          height: 1.5,
                          color: kTextMuted,
                        ),
                      ),

                      const SizedBox(height: 26),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: kVioletTint.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: kBorder),
                        ),
                        child: Column(
                          children: List.generate(_features.length, (i) {
                            final isLast = i == _features.length - 1;
                            return Padding(
                              padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 1),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      size: 13,
                                      color: kViolet,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      _features[i],
                                      style: const TextStyle(
                                        fontSize: 13.5,
                                        height: 1.4,
                                        color: kInk,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),

                      const Spacer(),

                      //get started button to continue to reg page
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kViolet,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Get started',
                            style: TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 13.5, color: kTextMuted),
                            children: [
                              TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kViolet,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
