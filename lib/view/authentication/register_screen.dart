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
              'Register Account',
              style: TextStyle(
                fontSize: Responsiveness.text(24),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: Responsiveness.height(3)),
            Text(
              'Masukan Email/ No. Hp untuk mendaftar ',
              style: TextStyle(
                color: Color(0xff838589),
                fontSize: Responsiveness.text(14),
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: Responsiveness.height(6)),
            Text(
              'Email/Phone',
              style: TextStyle(
                fontSize: Responsiveness.text(14),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Responsiveness.height(2)),
            CustomTextField(hintText: 'Masukan Alamat Email/ No Telepon Anda'),

            SizedBox(height: Responsiveness.height(8)),

            CustomButton(
              text: 'Continue',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationRegisterScreen(),
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
