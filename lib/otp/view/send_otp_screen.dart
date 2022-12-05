import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grappus_mobile/navigation/routes.gr.dart';
import 'package:sms_autofill/sms_autofill.dart';

// ignore: must_be_immutable
class SendOTPScreen extends StatelessWidget {
  SendOTPScreen({Key? key}) : super(key: key);

  TextEditingController mobileNumber = TextEditingController();

  Future<void> submit(BuildContext context) async {
    if (mobileNumber.text == '') return;

    final appSignatureID = await SmsAutoFill().getAppSignature;
    final sendOtpData = {
      'mobile_number': mobileNumber.text,
      'app_signature_id': appSignatureID
    };
    print(sendOtpData);
    await context.pushRoute(const VerifyOTPScreenRoute());
    /*   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VerifyOTPScreen()),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFC2C0C0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: mobileNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Mobile Number',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  submit(context);
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
