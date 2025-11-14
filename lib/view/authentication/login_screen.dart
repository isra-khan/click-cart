import 'package:flutter/material.dart';
import 'package:hackathon_isra/constant/colorconstraint.dart';
import 'package:hackathon_isra/constant/responsiveness.dart';
import 'package:hackathon_isra/view/authentication/register_screen.dart';
import 'package:hackathon_isra/view/authentication/reset_password_screen.dart';
import 'package:hackathon_isra/view/home_screen/home_screen.dart';
import 'package:hackathon_isra/widgets/custom_button.dart';
import 'package:hackathon_isra/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            SizedBox(height: Responsiveness.height(2)),
            Text(
              'Password',

              style: TextStyle(
                fontSize: Responsiveness.text(14),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Responsiveness.height(2)),
            CustomTextField(
              hintText: 'Masukan Alamat Email/ No Telepon Anda',
              isPasswordField: true,
            ),
            SizedBox(height: Responsiveness.height(8)),

            CustomButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              isOutlined: false,
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen(),
                      ),
                    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
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
            ),
          ],
        ),
      ),
    );
  }
}
