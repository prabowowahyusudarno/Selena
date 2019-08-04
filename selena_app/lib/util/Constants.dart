
class Constants {
  static const String error = "Error";
  static const String warning = "Warning";
  static const String success = "Success";

  static const String goalValidateMessage =
      "Your goal should have min of 10 characters";
  static const String nameValidateMessage = "Only alphabets are allowed";
  static const String usernameValidateMessage = "Enter a valid username";
  static const String passwordValidateMessage =
      "Password must be at least 4 characters";
  static const String passwordHint = "Enter Password";
  static const String emailHint = "Enter Email ID";
  static const String username = "username";
  static const String login = "Login";
  static const String errorLoginValidation =
      "Username or Password cannot be empty.";
  static const String sessionExpiredMessage = "Your session has expired";
  static const String refreshTokenFailed = "Login Failed, Please login manual";
  static const String errorSortMessage = "Filter type has not been choosen";
  static const String warningLegalApproveMessage =
      "Alll information (Background, Legal Basis, Resolution, Attachment) need to be opened";
  static const String noInternet = "No Internet Access";

  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String idToken = "idToken";
  static const String isEnableBiometric = "isEnableBiometric";
  static const String profileData = "profileData";

  static const String INPROGRESS = "inprogress";
  static const String INPROGRES = "inprogres";
  static const String IPROGRES = "iprogres";
  static const String IN_PROGRESS = "IN PROGRESS";
  static const String REJECT = "reject";
  static const String APPROVE = "approve";
  static const String APPROVED = "approveD";
  static const String OPEN = "open";
  static const String CANCEL = "cancel";

  static const Map<String, String> inboxType = {
    "BPH": "BPH",
    "BPUM": "BPUM",
    "BOD_Circular": "BOD Circular Resolution",
    "EXCOM_Circular": "EXCOM Circular Resolution",
    "BOC_Circular": "BOC Circular Resolution"
  };

//  static List<String> getProducsMenu() {
//    if (AppConfig.product == ProductApps.financial) {
//      return ["BPH", "BPUM"];
//    } else if (AppConfig.product == ProductApps.legal) {
//      return ["BOD_Circular", "EXCOM_Circular", "BOC_Circular"];
//    } else {
//      return ["BPH", "BPUM", "BOD_Circular", "EXCOM_Circular", "BOC_Circular"];
//    }
//  }
}
