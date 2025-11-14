import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/view/authentication/verification_register_screen.dart';
import 'package:hackathon_isra/view/authentication/verification_screen.dart';
import 'package:hackathon_isra/widgets/custom_button.dart' show CustomButton;
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsiveness.init(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderText(),
            SizedBox(height: Responsiveness.height(6)),
            _buildEmailField(),
            SizedBox(height: Responsiveness.height(8)),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  // ------------------- WIDGET METHODS -------------------

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstraint.backgroundColor,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Register Account',
          style: TextStyle(
            fontSize: Responsiveness.text(24),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: Responsiveness.height(3)),
        Text(
          'Masukan Email/ No. Hp untuk mendaftar',
          style: TextStyle(
            color: const Color(0xff838589),
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Email/Phone',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
        CustomTextField(hintText: 'Masukan Alamat Email/ No Telepon Anda'),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomButton(
      text: 'Continue',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerificationRegisterScreen()),
        );
      },
      isOutlined: false,
    );
  }
}
