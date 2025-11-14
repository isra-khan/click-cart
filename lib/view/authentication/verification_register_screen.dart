import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/routes/app_routes.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';

class VerificationRegisterScreen extends StatelessWidget {
  const VerificationRegisterScreen({super.key});

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
            _buildHeader(),
            SizedBox(height: Responsiveness.height(6)),
            _buildVerificationRow(),
            SizedBox(height: Responsiveness.height(2)),
            _buildOtpField(context),
            SizedBox(height: Responsiveness.height(12)),
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

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification',
          style: TextStyle(
            fontSize: Responsiveness.text(24),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: Responsiveness.height(3)),
        const Text(
          'Kami telah mengirimkan kode verifikasi ke +628*******716',
          style: TextStyle(
            color: Color(0xff838589),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Ganti?',
          style: TextStyle(
            color: ColorConstraint.buttonColor,
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Verification Code',
          style: TextStyle(
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.bold,
            color: ColorConstraint.primaryColor,
          ),
        ),
        Text(
          'Re-send code',
          style: TextStyle(
            color: ColorConstraint.buttonColor,
            fontSize: Responsiveness.text(14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpField(BuildContext context) {
    return OtpTextField(
      margin: EdgeInsetsGeometry.all(10),
      contentPadding: EdgeInsets.all(0),
      numberOfFields: 4,
      borderWidth: 0,
      borderColor: Colors.transparent,
      showFieldAsBox: true,
      fieldWidth: Responsiveness.width(18),
      filled: true,
      fillColor: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(12),
      cursorColor: ColorConstraint.primaryColor,
      textStyle: TextStyle(
        fontSize: Responsiveness.text(18),
        fontWeight: FontWeight.w600,
      ),
      onSubmit: (String code) {
        if (code.length == 4) {
          Navigator.pushNamed(context, AppRoutes.profilePassword);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter 4 digits OTP')),
          );
        }
      },
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomButton(
      text: 'Continue',
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.profilePassword);
      },
      isOutlined: false,
    );
  }
}
