import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

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
              'Update Password',
              style: TextStyle(
                fontSize: Responsiveness.text(24),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: Responsiveness.height(3)),
            Text(
              'Lengkapi data terakhir berikut untuk masuk ke aplikasi Mega Mall',
              style: TextStyle(
                color: Color(0xff838589),
                fontSize: Responsiveness.text(14),
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: Responsiveness.height(6)),
            Text(
              'New Password',
              style: TextStyle(
                fontSize: Responsiveness.text(14),
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: Responsiveness.height(2)),

            CustomTextField(hintText: 'Masukan Kata Sandi Akun'),
            SizedBox(height: Responsiveness.height(2)),
            Row(
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
            ),
            SizedBox(height: Responsiveness.height(2)),
            Text(
              'Confirm New Password',

              style: TextStyle(
                fontSize: Responsiveness.text(14),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Responsiveness.height(2)),
            CustomTextField(
              hintText: 'Masukan Kata Sandi Akun',
              isPasswordField: true,
            ),
            SizedBox(height: Responsiveness.height(10)),

            CustomButton(
              text: 'Save Password',
              onPressed: () {},
              isOutlined: false,
            ),
          ],
        ),
      ),
    );
  }
}
