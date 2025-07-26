import 'package:bartr/ui/signup.dart';
import 'package:bartr/widgets/round_button.dart';

import '../const/consts.dart';
import '../const/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: fontWhite,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              150.heightBox,
              Text(bartr, style: borelLg),
              220.heightBox,
              RoundButton(
                title: signUp,
                titleColor: fontWhite,
                height: 64.0,
                width: 250.0,
                color: fontBlue,
                fontSize: 18.0,
                enabledBorder: false,
                ontap: () {
                  Get.to(()=>SignupScreen());
                }
              ),
              10.heightBox,
              Text(
                alreadyHaveAccount,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
