import 'package:flutter/material.dart';
import 'package:my_app/const/colors.dart';
import 'package:my_app/providers/post_providers.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  _logInState createState() => _logInState();
}

class _logInState extends State<logIn> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: key,
      // backgroundColor: Color(0xfff7f7f7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "App Posts",
        ),
        backgroundColor: basicColor,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 40),
                Center(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: basicColor,
                            fontSize: 14),
                        children: const <TextSpan>[
                          TextSpan(text: "LogIn"),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Wrap(
                      direction: Axis.vertical,

                      spacing: 8,

                      // // alignment: WrapAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(color: basicColor, fontSize: 12),
                        ),

                        //email textfield
                        SizedBox(
                          width: width / 1.2,
                          child: TextFormField(
                            style: TextStyle(color: basicColor, fontSize: 14),
                            validator: (val) {
                              if (val!.isEmpty) return 'must required field';
                            },
                            controller: email,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            cursorColor: basicColor,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide:
                                      BorderSide(color: textfieldColor)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: textfieldColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(color: textfieldColor),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 14),
                              hintText: "example@gmail.com",
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(color: basicColor, fontSize: 12),
                        ),

                        //password textfield
                        SizedBox(
                          width: width / 1.2,
                          child: TextFormField(
                            style: TextStyle(color: basicColor, fontSize: 14),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Must Required field';
                              } else {
                                if (val.length < 6) {
                                  return 'Your password is less than 6 characters';
                                }
                              }
                            },
                            controller: password,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            cursorColor: basicColor,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.remove_red_eye),
                                  iconSize: 18,
                                  color: basicColor,
                                  onPressed: _toggle,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    borderSide:
                                        BorderSide(color: textfieldColor)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: textfieldColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: textfieldColor),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 14),
                                hintText: "· · · · · · · · · · ",
                                fillColor: textfieldColor),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    //login button
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 16,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(
                                color: basicColor,
                              )),
                          primary: basicColor,
                        ),
                        onPressed: () async {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email.text);
                          if (formkey.currentState!.validate() && emailValid) {
                            await login_or_signUp();
                          } else {}
                        },
                        child: const Text(
                          "Sign in or logIn",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  login_or_signUp() {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);

      auth.firebaseAuth
          .fetchSignInMethodsForEmail(email.text.trim())
          .then((value) => {
                if (value.isEmpty) {sign_up()} else {log_in()}
              });
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  log_in() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    final postProvider = Provider.of<PostStore>(context, listen: false);

    await auth.signInWithEmailAndPassword(email.text, password.text, context);
    postProvider.getfavorites();
    postProvider.getviews();
  }

  sign_up() async {
    final postProvider = Provider.of<PostStore>(context, listen: false);

    final auth = Provider.of<AuthService>(context, listen: false);
    await auth.createUserWithEmailAndPassword(
        email.text, password.text, context);
    postProvider.getfavorites();
    postProvider.getviews();
  }
}
