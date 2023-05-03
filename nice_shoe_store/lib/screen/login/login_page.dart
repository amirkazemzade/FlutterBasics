import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shoe_store/logic/bloc/login/login_bloc.dart';
import 'package:nike_shoe_store/screen/app_routes.dart';

import '../../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var showPassword = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Logged In")));
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.home,
                (route) => false,
              );
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return _content(context);
            },
          ),
        ),
      ),
    );
  }

  Container _content(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: lightGrayColor,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            const SizedBox(height: 100),
            const Text(
              login,
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const Text(
              pleaseEnterEmailAndPassword,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            _emailTextField(),
            const SizedBox(height: 40),
            _passwordTetField(),
            const SizedBox(height: 40),
            _button(context),
            const SizedBox(height: 20),
            const Text(
              haveNoAccount,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.signUp, (route) => false);
              },
              child: const Text(
                signup,
                style: TextStyle(fontSize: 18, color: blueColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField _passwordTetField() {
    return TextField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.right,
      obscureText: showPassword,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide(color: darkBlueColor, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide(color: Colors.white, width: 1)),
          hintText: password,
          filled: true,
          suffixIcon: const Icon(Icons.key),
          prefixIcon: InkWell(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: (!showPassword)
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          fillColor: Colors.white),
    );
  }

  TextField _emailTextField() {
    return TextField(
      controller: emailController,
      textAlign: TextAlign.right,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: darkBlueColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: Colors.white, width: 1)),
        hintText: email,
        filled: true,
        suffixIcon: Icon(Icons.alternate_email),
        fillColor: Colors.white,
      ),
    );
  }

  FilledButton _button(BuildContext context) {
    return FilledButton(
      onPressed: () => _onLogin(context),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(blueColor),
        minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width, 45)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: const Text(
        login,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  void _onLogin(BuildContext context) {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      context.read<LoginBloc>().add(
            OnLogin(
                email: emailController.text, password: passwordController.text),
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.warning_amber),
              Text(pleaseEnterAllFields),
            ],
          ),
        ),
      );
    }
  }
}
