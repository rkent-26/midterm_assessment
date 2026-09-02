import 'package:flutter/material.dart';

// Just a display screen — no state to manage here, so StatelessWidget is fine.
// It only shows back what the user typed in on the registration form.
class ConfirmationScreen extends StatelessWidget {
  final String fullName;
  final String phoneNumber;
  final String email;

  const ConfirmationScreen({
    super.key,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
  });

  // Bundling the 3 fields into a list so we can loop through them
  // in the ListView below instead of writing 3 almost-identical ListTiles.
  List<_ConfirmationItem> get _items => [
    _ConfirmationItem(
      icon: Icons.person_outline,
      label: 'Full Name',
      value: fullName,
    ),
    _ConfirmationItem(icon: Icons.email_outlined, label: 'Email', value: email),
    _ConfirmationItem(
      icon: Icons.phone_outlined,
      label: 'Phone Number',
      value: phoneNumber,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        title: const Text('Confirm Your Details'),
        backgroundColor: const Color(0xFFF4F6FB),
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Little success card up top so it doesn't feel like just a plain form dump.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: primaryColor,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Almost done!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Please review your details before confirming.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Here's where we actually show what the user typed —
              // wrapped in a Card, rows built with a ListView so it scrolls
              // nicely if we ever add more fields later (birthdate, etc.).
              Expanded(
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey.shade200,
                    ),
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(item.icon, color: primaryColor, size: 20),
                        ),
                        title: Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            // Fallback dash just in case a field somehow comes in empty,
                            // so we don't show a blank line.
                            item.value.isEmpty ? '—' : item.value,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Edit = go back to the form (pop). Confirm = pretend we "submitted"
              // and pop up a SnackBar so the user gets some feedback.
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        // Just a SnackBar for now — swap this for a real
                        // submit/API call once the backend side is ready.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Registration confirmed!'),
                            backgroundColor: primaryColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tiny helper so each row in the list just carries an icon + label + value
// instead of repeating three separate lists in sync with each other.
class _ConfirmationItem {
  final IconData icon;
  final String label;
  final String value;

  const _ConfirmationItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
