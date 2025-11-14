import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/view/authentication/profile_password_screen.dart';
import 'package:hackathon_isra/view/authentication/update_password_screen.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class VerificationRegisterScreen extends StatelessWidget {
  const VerificationRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var responsive = Responsiveness.init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstraint.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
            SizedBox(height: Responsiveness.height(6)),

            Row(
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
                  'Re-send  code',
                  style: TextStyle(
                    color: ColorConstraint.buttonColor,
                    fontSize: Responsiveness.text(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            /// 🔹 OTP Fields
            SizedBox(height: Responsiveness.height(2)),

            OtpTextField(
              margin: EdgeInsetsGeometry.all(10),
              contentPadding: EdgeInsets.all(0),
              numberOfFields: 4,
              borderWidth: 0, // remove borders
              borderColor: Colors.transparent, // ensure no visible border
              showFieldAsBox: true,
              fieldWidth: Responsiveness.width(18),
              filled: true,
              fillColor: Colors.grey.shade200, // grey background
              borderRadius: BorderRadius.circular(12),
              cursorColor: ColorConstraint.primaryColor,
              textStyle: TextStyle(
                fontSize: Responsiveness.text(18),
                fontWeight: FontWeight.w600,
              ),
              onSubmit: (String code) {
                if (code.length == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdatePasswordScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter 4 digits OTP')),
                  );
                }
              },
            ),

            SizedBox(height: Responsiveness.height(12)),

            CustomButton(
              text: 'Continue',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePasswordScreen(),
                  ),
                );
              },
              isOutlined: false,
            ),
          ],
        ),
      ),
    );
  }
}
