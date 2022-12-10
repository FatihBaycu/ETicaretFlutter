import 'package:e_ticaret_flutter/components/build_text_file_decoration.dart';
import 'package:e_ticaret_flutter/components/image_widget.dart';
import 'package:e_ticaret_flutter/models/auths/login_model.dart';
import 'package:e_ticaret_flutter/models/auths/token_response_model.dart';
import 'package:e_ticaret_flutter/screens/products/product_list_screen.dart';
import 'package:e_ticaret_flutter/services/auths/auth_service.dart';
import 'package:e_ticaret_flutter/services/users/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);



  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var email = TextEditingController();
  var password = TextEditingController();
  var loginModel = LoginModel(usernameOrEmail: "",password: "");
  var tokenResponseModel=TokenResponseModel();
  var authService=AuthService();
  var userService=UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageWidget(
                  "https://www.nicepng.com/png/detail/247-2475175_ecommerce-e-commerce-website-logo.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  decoration:
                  buildTextFieldDecortaion("Email", "example@example.com"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: buildTextFieldDecortaion("Password", "*********"),
                ),
              ),
              ElevatedButton(onPressed: () async{
                loginModel.usernameOrEmail="string@string.com";
                loginModel.password="123";
                await context.read<AuthService>().login(loginModel).then((value) =>{
                  sendValue(),
                });
              }, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }

  sendValue()async{
    await userService.getUserByEmail(loginModel.usernameOrEmail!);
    await context.read<UserService>().getUserByEmail(loginModel.usernameOrEmail!);
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductListScreen()),
     );
  }

}

