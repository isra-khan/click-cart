import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class ProfilePasswordScreen extends StatelessWidget {
  const ProfilePasswordScreen({super.key});

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
            _buildFullNameField(),
            SizedBox(height: Responsiveness.height(2)),
            _buildPasswordField(),
            SizedBox(height: Responsiveness.height(8)),
            _buildConfirmationButton(),
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
          'Profile & Password',
          style: TextStyle(
            fontSize: Responsiveness.text(24),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: Responsiveness.height(3)),
        Text(
          'Lengkapi data terakhir berikut untuk masuk ke aplikasi Click Cart',
          style: TextStyle(
            color: const Color(0xff838589),
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildFullNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Full Name',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
        CustomTextField(hintText: 'Masukan Alamat Email/ No Telepon Anda'),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Password',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
        CustomTextField(
          hintText: 'Masukan Kata Sandi Akun',
          isPasswordField: true,
        ),
      ],
    );
  }

  Widget _buildConfirmationButton() {
    return CustomButton(
      text: 'Confirmation',
      onPressed: () {},
      isOutlined: false,
    );
  }
}
