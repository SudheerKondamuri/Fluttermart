import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeProfileInfoPage extends StatefulWidget {
  const ChangeProfileInfoPage({super.key});

  @override
  State<ChangeProfileInfoPage> createState() => _ChangeProfileInfoPageState();
}

class _ChangeProfileInfoPageState extends State<ChangeProfileInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController(
    text: "Bear grills",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "BearGrills.wild@example.com",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "+1 234 567 890",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "123 Main St, Vishakapatnam, India",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Change Profile Info',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField('Full Name', _nameController),
              const SizedBox(height: 15),
              buildTextField(
                'Email',
                _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              buildTextField(
                'Phone',
                _phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 15),
              buildTextField(
                'Shipping Address',
                _addressController,
                maxLines: 3,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC9A86B),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile info updated')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFC9A86B)),
        ),
        fillColor: Colors.grey.shade800,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (label == 'Email' && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
