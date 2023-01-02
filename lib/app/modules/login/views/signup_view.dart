import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:homlisellerapp/app/modules/home/views/home_view.dart';
import 'package:homlisellerapp/app/modules/registration/views/registration_view.dart';
import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: CircleAvatar(
                radius: 128,
                backgroundColor: Colors.transparent,
                child: Image(
                  image: AssetImage('assets/images/png/homilylogo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'Namaste!',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: FixedColors.black,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldWidget(
                hintText: 'Nikhil.Zrow@gmail.com', labelText: 'Email / Phone'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: FixedColors.purple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    'Login via OTP',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: FixedColors.purple,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            OtpTextField(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              decoration: const InputDecoration(
                  constraints: BoxConstraints(minHeight: 0.5, minWidth: 0.5)),
              borderWidth: 1,
              keyboardType: TextInputType.number,
              cursorColor: FixedColors.black,
              numberOfFields: 4,
              borderColor: FixedColors.purple,
              showFieldAsBox: true,
              focusedBorderColor: FixedColors.purple,
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              '00:30',
              style: TextStyle(color: FixedColors.grey),
            )),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeView()));
              },
              child: Container(
                width: 290,
                height: 40,
                decoration: BoxDecoration(
                  color: FixedColors.purple,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Want to be a Seller? ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: FixedColors.grey),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegistrationView()));
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Follow us on ',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: FixedColors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                        image: AssetImage('assets/images/png/instagram 1.png')),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                        image:
                            AssetImage('assets/images/png/facebook (1) 1.png')),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                        image:
                            AssetImage('assets/images/png/twitter (1) 1.png')),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Image(
                        image: AssetImage('assets/images/png/youtube 1.png')),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
