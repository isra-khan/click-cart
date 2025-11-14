import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/routes/routes.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            _buildWelcomeText(),
            SizedBox(height: Responsiveness.height(6)),
            _buildEmailField(),
            SizedBox(height: Responsiveness.height(2)),
            _buildPasswordField(),
            SizedBox(height: Responsiveness.height(8)),
            _buildSignInButton(context),
            const Spacer(),
            _buildBottomLinks(context),
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

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back to\nMega Mall',
          style: TextStyle(
            fontSize: Responsiveness.text(24),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: Responsiveness.height(3)),
        Text(
          'Silahkan masukan data untuk login',
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
      children: [
        Text(
          'Email/Phone',
          style: TextStyle(
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: Responsiveness.height(2)),
        const CustomTextField(
          hintText: 'Masukan Alamat Email/ No Telepon Anda',
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: Responsiveness.height(2)),
        const CustomTextField(
          hintText: 'Masukan Alamat Email/ No Telepon Anda',
          isPasswordField: true,
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return CustomButton(
      text: 'Sign In',
      onPressed: () {
        Navigator.pushReplacementNamed(context, AppRoutes.mainNavigation);
      },
      isOutlined: false,
    );
  }

  Widget _buildBottomLinks(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.resetPassword);
          },
          child: Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: Responsiveness.text(14),
              fontWeight: FontWeight.w500,
              color: ColorConstraint.primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.register);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: Responsiveness.text(14),
              fontWeight: FontWeight.w500,
              color: ColorConstraint.buttonColor,
            ),
          ),
        ),
      ],
    );
  }
}
