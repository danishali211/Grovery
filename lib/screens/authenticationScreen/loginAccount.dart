import 'package:egrocer/helper/generalWidgets/customCheckbox.dart';
import 'package:egrocer/helper/utils/generalImports.dart';

class LoginAccount extends StatefulWidget {
  final String? from;

  const LoginAccount({Key? key, this.from}) : super(key: key);

  @override
  State<LoginAccount> createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  CountryCode? selectedCountryCode;
  bool isLoading = false, isAcceptedTerms = false;

  // TODO REMOVE DEMO NUMBER FROM HERE
  TextEditingController edtPhoneNumber =
      TextEditingController();
  bool isDark = Constant.session.getBoolData(SessionManager.isDarkTheme);
  String otpVerificationId = "";
  String phoneNumber = "";
  int? forceResendingToken;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      try {
        await LocalAwesomeNotification().init(context);

        await FirebaseMessaging.instance.getToken().then((token) {
          Constant.session.setData(SessionManager.keyFCMToken, token!, false);
        });
      } catch (ignore) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Constant.size10, vertical: Constant.size20),
              child: Container(
                constraints: BoxConstraints(maxHeight: context.width * 0.5),
                child: defaultImg(
                  image: "logo",
                  requiredRTL: false,
                ),
              ),
            ),
            Card(
              color: Theme.of(context).cardColor,
              surfaceTintColor: Theme.of(context).cardColor,
              shape: DesignConfig.setRoundedBorderSpecific(10,
                  istop: true, isbtm: true),
              margin: EdgeInsets.symmetric(
                  horizontal: Constant.size5, vertical: Constant.size5),
              child: loginWidgets(),
            ),
          ],
        ),
      ),
    );
  }

  proceedBtn() {
    return isLoading
        ? Container(
            height: 55,
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          )
        : gradientBtnWidget(context, 10,
            title: getTranslatedValue(
              context,
              "login",
            ).toUpperCase(), callback: () {
            loginWithPhoneNumber();
          });
  }

  skipLoginText() {
    return GestureDetector(
      onTap: () async {
        if (isLoading == false) {
          Constant.session
              .setBoolData(SessionManager.keySkipLogin, true, false);
          await getRedirection();
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: CustomTextLabel(
          jsonKey: "skip_login",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isLoading == false ? ColorsRes.appColor : ColorsRes.grey,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  loginWidgets() {
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.symmetric(
          vertical: Constant.size30, horizontal: Constant.size20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: CustomTextLabel(
            jsonKey: "welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              fontSize: 30,
              color: ColorsRes.mainTextColor,
            ),
          ),
          subtitle: CustomTextLabel(
            jsonKey: "login_enter_number_message",
            style: TextStyle(color: ColorsRes.grey),
          ),
        ),
        getSizedBox(
          height: Constant.size40,
        ),
        Container(
            decoration: DesignConfig.boxDecoration(
                Theme.of(context).scaffoldBackgroundColor, 10),
            child: mobileNoWidget()),
        getSizedBox(
          height: Constant.size15,
        ),
        Row(
          children: [
            CustomCheckbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: isAcceptedTerms,
              activeColor: ColorsRes.appColor,
              onChanged: (bool? val) {
                setState(() {
                  isAcceptedTerms = val!;
                });
              },
            ),
            //padding: const EdgeInsets.only(top: 15.0),
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                          fontWeight: FontWeight.w400,
                          color: ColorsRes.mainTextColor,
                        ),
                      ),
                  text: "${getTranslatedValue(
                    context,
                    "agreement_message_1",
                  )}\t",
                  children: <TextSpan>[
                    TextSpan(
                        text: getTranslatedValue(context, "terms_of_service"),
                        style: TextStyle(
                          color: ColorsRes.appColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, webViewScreen,
                                arguments: getTranslatedValue(
                                  context,
                                  "terms_and_conditions",
                                ));
                          }),
                    TextSpan(
                        text: "\t${getTranslatedValue(
                          context,
                          "and",
                        )}\t",
                        style: TextStyle(
                          color: ColorsRes.mainTextColor,
                        )),
                    TextSpan(
                        text: getTranslatedValue(context, "privacy_policy"),
                        style: TextStyle(
                          color: ColorsRes.appColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, webViewScreen,
                                arguments: getTranslatedValue(
                                  context,
                                  "privacy_policy",
                                ));
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
        getSizedBox(
          height: Constant.size40,
        ),
        proceedBtn(),
        getSizedBox(
          height: Constant.size40,
        ),
        skipLoginText(),
      ]),
    );
  }

  mobileNoWidget() {
    return Row(
      children: [
        const SizedBox(width: 5),
        Icon(
          Icons.phone_android,
          color: ColorsRes.mainTextColor,
        ),
        IgnorePointer(
          ignoring: isLoading,
          child: CountryCodePicker(
            onInit: (countryCode) {
              selectedCountryCode = countryCode;
            },
            onChanged: (countryCode) {
              selectedCountryCode = countryCode;
            },
            initialSelection: Constant.initialCountryCode,
            textOverflow: TextOverflow.ellipsis,
            showCountryOnly: false,
            alignLeft: false,
            backgroundColor: Theme.of(context).cardColor,
            textStyle: TextStyle(color: ColorsRes.mainTextColor),
            dialogBackgroundColor: Theme.of(context).cardColor,
            dialogSize: Size(context.width, context.height * 0.9),
            padding: EdgeInsets.zero,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: ColorsRes.grey,
          size: 15,
        ),
        getSizedBox(
          width: Constant.size10,
        ),
        Flexible(
          child: TextField(
            controller: edtPhoneNumber,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              color: ColorsRes.mainTextColor,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintStyle: TextStyle(color: Colors.grey[300]),
              hintText: "9999999999",
            ),
          ),
        )
      ],
    );
  }

  getRedirection() async {
    if (Constant.session.getBoolData(SessionManager.keySkipLogin) ||
        Constant.session.getBoolData(SessionManager.isUserLogin)) {
      if ((Constant.session.getData(SessionManager.keyLatitude) == "" &&
              Constant.session.getData(SessionManager.keyLongitude) == "") ||
          (Constant.session.getData(SessionManager.keyLatitude) == "0" &&
              Constant.session.getData(SessionManager.keyLongitude) == "0")) {
        Navigator.pushReplacementNamed(context, confirmLocationScreen,
            arguments: [null, "location"]);
      } else if (Constant.session
          .getData(SessionManager.keyUserName)
          .isNotEmpty) {
        Navigator.pushReplacementNamed(
          context,
          mainHomeScreen,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          mainHomeScreen,
          (route) => false,
        );
      }
    }
  }

  Future<bool> mobileNumberValidation() async {
    bool checkInternet = await GeneralMethods.checkInternet();
    String? mobileValidate = await GeneralMethods.phoneValidation(
      edtPhoneNumber.text,
    );
    if (!checkInternet) {
      GeneralMethods.showMessage(
        context,
        getTranslatedValue(
          context,
          "check_internet",
        ),
        MessageType.warning,
      );
      return false;
    } else if (mobileValidate == "") {
      GeneralMethods.showMessage(
        context,
        getTranslatedValue(
          context,
          "enter_valid_mobile",
        ),
        MessageType.warning,
      );
      return false;
    } else if (mobileValidate != null && edtPhoneNumber.text.length > 15) {
      GeneralMethods.showMessage(
        context,
        getTranslatedValue(
          context,
          "enter_valid_mobile",
        ),
        MessageType.warning,
      );
      return false;
    } else if (!isAcceptedTerms) {
      GeneralMethods.showMessage(
        context,
        getTranslatedValue(
          context,
          "accept_terms_and_condition",
        ),
        MessageType.warning,
      );

      return false;
    } else {
      return true;
    }
  }

  loginWithPhoneNumber() async {
    var validation = await mobileNumberValidation();
    if (validation) {
      if (isLoading) return;
      setState(() {
        isLoading = true;
      });
      firebaseLoginProcess();
    }
  }

  firebaseLoginProcess() async {
    if (edtPhoneNumber.text.isNotEmpty) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        timeout: Duration(seconds: Constant.otpTimeOutSecond),
        phoneNumber: '${selectedCountryCode!.dialCode}${edtPhoneNumber.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          GeneralMethods.showMessage(
            context,
            e.message!,
            MessageType.warning,
          );

          setState(() {
            isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          forceResendingToken = resendToken;
          isLoading = false;
          setState(() {
            phoneNumber =
                '${selectedCountryCode!.dialCode} - ${edtPhoneNumber.text}';
            otpVerificationId = verificationId;

            List<dynamic> firebaseArguments = [
              firebaseAuth,
              otpVerificationId,
              edtPhoneNumber.text,
              selectedCountryCode!,
              widget.from ?? null
            ];
            Navigator.pushNamed(context, otpScreen,
                arguments: firebaseArguments);
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        },
        forceResendingToken: forceResendingToken,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
