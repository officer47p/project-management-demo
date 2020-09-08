import "package:flutter/material.dart";
import 'package:neumorphic/neumorphic.dart';
import '../enums.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthType _authType = AuthType.SignIn;
  final formKey = GlobalKey<FormState>();
  Map credentials = {"email": "", "password": ""};
  String validatingPassword;

  void submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      print("Everything validates");
      form.save();
      if (_authType == AuthType.SignIn) {
        // Do Something
      } else {
        // Do Something
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Task Flow",
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            NeuCard(
              curveType: CurveType.flat,
              bevel: 8,
              width: 400,
              decoration: NeumorphicDecoration(
                borderRadius: BorderRadius.circular(10),
                color: scaffoldColor,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        _authType == AuthType.SignIn ? "Sign In" : "Sign Up",
                        style: TextStyle(fontFamily: "Rubik", fontSize: 30),
                      ),
                    ),
                    CustomTextFormField(
                      color: scaffoldColor,
                      hintText: "Email",
                      onSaved: (value) => credentials["email"] = value,
                      validator: (value) {
                        if (value.isEmpty)
                          return "Please enter an email address";
                        if (!value.contains("@"))
                          return "Please enter a valid email address";
                        else
                          return null;
                      },
                    ),
                    CustomTextFormField(
                      color: scaffoldColor,
                      hintText: "Password",
                      onSaved: (value) => credentials["password"] = value,
                      obsecureText: true,
                      onChanged: (value) => validatingPassword = value,
                      validator: (value) {
                        if (value.isEmpty) return "Please enter a password";
                        if (value.length < 8)
                          return "Password must be 8 characters or more";
                        else
                          return null;
                      },
                    ),
                    if (_authType == AuthType.SignUp)
                      CustomTextFormField(
                        color: scaffoldColor,
                        hintText: "Repeat Password",
                        obsecureText: true,
                        validator: (value) {
                          if (value.isEmpty) return "Please enter a password";
                          if (value.length < 8)
                            return "Password must be 8 characters or more";
                          if (value != validatingPassword)
                            return "Passwords don't match";
                          else
                            return null;
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 100),
                        child: NeuButton(
                          onPressed: submit,
                          bevel: 8,
                          decoration: NeumorphicDecoration(
                            color: scaffoldColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _authType == AuthType.SignIn
                                ? "Sign In"
                                : "Sign Up",
                            style: TextStyle(fontFamily: "Rubik", fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Text(
                        _authType == AuthType.SignIn
                            ? "Don't have an account? Sign Up"
                            : "Have an account? Sign In",
                        style: TextStyle(fontFamily: "Rubik", fontSize: 13),
                      ),
                      onPressed: () {
                        setState(() {
                          _authType = _authType == AuthType.SignIn
                              ? AuthType.SignUp
                              : AuthType.SignIn;
                        });
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final color;
  final hintText;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final bool obsecureText;
  CustomTextFormField({
    this.color,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.obsecureText,
  });
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.emboss,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: NeumorphicDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: obsecureText ?? false,
        style: TextStyle(fontFamily: "Rubik"),
        decoration: InputDecoration(
          errorStyle: TextStyle(fontFamily: "Rubik"),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
