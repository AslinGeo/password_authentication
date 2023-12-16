import 'package:get/get.dart';
import 'package:password_authentication/password/password.variables.dart';
import 'package:local_auth/local_auth.dart';
import 'package:password_authentication/password/success.view.dart';

class PasswordController extends GetxController with PasswordVariables {
  checkAuthentication() async {
// ···
    final LocalAuthentication auth = LocalAuthentication();
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isEmpty) {
      Get.snackbar("", "You donot have any biometrics");
    } else {
      try {
        final bool didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to show account balance');
        if (didAuthenticate) {
          Get.to(const SuccessView());
        }
        // ···
      } catch (e) {
        // ...
      }
    }
  }
}
