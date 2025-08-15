class FirebaseAuthExceptionHandler implements Exception {
  final String code;
  final String message;

  static const Map<String, String> _messages = {
    "admin-restricted-operation":
        "This operation is restricted to administrators.",
    "argument-error": "Internal argument error.",
    "app-not-authorized":
        "The app is not authorized to use Firebase Authentication.",
    "app-not-installed": "The required app is not installed.",
    "captcha-check-failed": "Captcha verification failed.",
    "code-expired":
        "The verification code has expired. Please request a new one.",
    "cordova-not-ready": "The Cordova app is not ready.",
    "cors-unsupported": "Your browser does not support CORS.",
    "credential-already-in-use":
        "This credential is already associated with another account.",
    "custom-token-mismatch": "Invalid or mismatched token.",
    "requires-recent-login": "For security, please sign in again.",
    "dependent-sdk-initialized-before-auth":
        "Dependent SDK initialized before authentication.",
    "dynamic-link-not-activated": "Dynamic link feature is not activated.",
    "email-change-needs-verification": "Verify your email before changing it.",
    "email-already-in-use": "This email is already in use.",
    "emulator-config-failed": "Emulator configuration failed.",
    "expired-action-code": "The action code has expired.",
    "cancelled-popup-request": "The authentication request was cancelled.",
    "internal-error": "Internal error. Please try again later.",
    "invalid-api-key": "Invalid API key.",
    "invalid-app-credential": "Invalid app credential.",
    "invalid-app-id": "Invalid app ID.",
    "invalid-user-token": "Invalid user token.",
    "invalid-auth-event": "Invalid authentication event.",
    "invalid-cert-hash": "Invalid certificate hash.",
    "invalid-verification-code": "Invalid verification code.",
    "invalid-continue-uri": "Invalid continue URL.",
    "invalid-cordova-configuration": "Invalid Cordova configuration.",
    "invalid-custom-token": "Invalid custom token.",
    "invalid-dynamic-link-domain": "Invalid dynamic link domain.",
    "invalid-email": "Invalid email address.",
    "invalid-emulator-scheme": "Invalid emulator scheme.",
    "invalid-credential": "Invalid credentials.",
    "invalid-message-payload": "Invalid message payload.",
    "invalid-multi-factor-session": "Invalid multi-factor session.",
    "invalid-oauth-client-id": "Invalid OAuth client ID.",
    "invalid-oauth-provider": "Invalid OAuth provider.",
    "invalid-action-code": "Invalid action code.",
    "unauthorized-domain": "Unauthorized domain.",
    "wrong-password": "Incorrect password.",
    "invalid-persistence-type": "Invalid persistence type.",
    "invalid-phone-number": "Invalid phone number.",
    "invalid-provider-id": "Invalid provider ID.",
    "invalid-recipient-email": "Invalid recipient email address.",
    "invalid-sender": "Invalid sender.",
    "invalid-verification-id": "Invalid verification ID.",
    "invalid-tenant-id": "Invalid tenant ID.",
    "multi-factor-info-not-found": "Multi-factor info not found.",
    "multi-factor-auth-required": "Multi-factor authentication is required.",
    "missing-android-pkg-name": "Missing Android package name.",
    "missing-app-credential": "Missing app credential.",
    "auth-domain-config-required":
        "Authentication domain configuration is required.",
    "missing-verification-code": "Missing verification code.",
    "missing-continue-uri": "Missing continue URL.",
    "missing-iframe-start": "Missing iframe start.",
    "missing-ios-bundle-id": "Missing iOS bundle ID.",
    "missing-or-invalid-nonce": "Missing or invalid nonce.",
    "missing-multi-factor-info": "Missing multi-factor info.",
    "missing-multi-factor-session": "Missing multi-factor session.",
    "missing-phone-number": "Missing phone number.",
    "missing-verification-id": "Missing verification ID.",
    "app-deleted": "The app has been deleted.",
    "account-exists-with-different-credential":
        "An account already exists with these credentials but linked to another sign-in method.",
    "network-request-failed":
        "Network request failed. Check your internet connection.",
    "null-user": "No user is currently signed in.",
    "no-auth-event": "No authentication event found.",
    "no-such-provider": "Provider not found.",
    "operation-not-allowed": "Operation not allowed.",
    "operation-not-supported-in-this-environment":
        "Operation not supported in this environment.",
    "popup-blocked": "The popup was blocked by the browser.",
    "popup-closed-by-user": "The popup was closed by the user.",
    "provider-already-linked":
        "The provider is already linked to this account.",
    "quota-exceeded": "Quota exceeded.",
    "redirect-cancelled-by-user": "Redirect cancelled by the user.",
    "redirect-operation-pending": "Redirect operation pending.",
    "rejected-credential": "Credential rejected.",
    "second-factor-already-in-use": "The second factor is already in use.",
    "maximum-second-factor-count-exceeded":
        "Maximum number of second factors exceeded.",
    "tenant-id-mismatch": "Tenant ID mismatch.",
    "timeout": "Operation timed out.",
    "user-token-expired": "User token has expired.",
    "too-many-requests": "Too many requests. Please try again later.",
    "unauthorized-continue-uri": "Unauthorized continue URL.",
    "unsupported-first-factor": "Unsupported first factor.",
    "unsupported-persistence-type": "Unsupported persistence type.",
    "unsupported-tenant-operation": "Unsupported tenant operation.",
    "unverified-email": "Email address is not verified.",
    "user-cancelled": "Action cancelled by the user.",
    "user-not-found": "User not found.",
    "user-disabled": "This account has been disabled.",
    "user-mismatch":
        "The supplied credentials do not match the logged-in user.",
    "user-signed-out": "The user has been signed out.",
    "weak-password": "The password is too weak.",
    "web-storage-unsupported": "Web storage is not supported.",
    "already-initialized": "Firebase Auth has already been initialized.",
    "recaptcha-not-enabled": "ReCAPTCHA is not enabled.",
    "missing-recaptcha-token": "Missing ReCAPTCHA token.",
    "invalid-recaptcha-token": "Invalid ReCAPTCHA token.",
    "invalid-recaptcha-action": "Invalid ReCAPTCHA action.",
    "missing-client-type": "Missing client type.",
    "missing-recaptcha-version": "Missing ReCAPTCHA version.",
    "invalid-recaptcha-version": "Invalid ReCAPTCHA version.",
    "invalid-req-type": "Invalid request type.",
    "invalid-hosting-link-domain": "Invalid hosting link domain.",
    "default": "An unexpected error occurred. Please try again later."
  };

  FirebaseAuthExceptionHandler(this.code)
      : message = _messages[code] ?? _messages["default"]!;

  @override
  String toString() => message;
}
