import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

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
            _buildNewPasswordField(),
            SizedBox(height: Responsiveness.height(2)),
            _buildPasswordInfo(),
            SizedBox(height: Responsiveness.height(2)),
            _buildConfirmPasswordField(),
            SizedBox(height: Responsiveness.height(10)),
            _buildSaveButton(),
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
          'Update Password',
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

  Widget _buildNewPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'New Password',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
        CustomTextField(hintText: 'Masukan Kata Sandi Akun'),
      ],
    );
  }

  Widget _buildPasswordInfo() {
    return Row(
      children: [
        Icon(Icons.info_outline, color: ColorConstraint.lightGray),
        SizedBox(width: Responsiveness.width(2)),
        Text(
          "Kata sandi harus 6 karakter atau lebih",
          style: TextStyle(
            color: ColorConstraint.lightGray,
            fontSize: Responsiveness.text(14),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Confirm New Password',
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

  Widget _buildSaveButton() {
    return CustomButton(
      text: 'Save Password',
      onPressed: () {},
      isOutlined: false,
    );
  }
}
