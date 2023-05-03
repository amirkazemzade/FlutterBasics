import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shoe_store/constants.dart';
import 'package:nike_shoe_store/logic/bloc/sign_up/sign_up_bloc.dart';
import 'package:nike_shoe_store/screen/app_routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var showPassword = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Signed Up")),
            );
            Navigator.of(context).pushNamed(AppRoutes.home);
          }
          if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: Scaffold(
          body: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoading) {
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
            const SizedBox(
              height: 100,
            ),
            const Text(
              signup,
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const Text(
              pleaseEnterEmailAndPassword,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            _emailTextField(),
            const SizedBox(
              height: 40,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 40,
            ),
            _signUpButton(context),
            const SizedBox(
              height: 20,
            ),
            const Text(
              haveAccount,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            _goToLoginPage(context),
          ],
        ),
      ),
    );
  }

  InkWell _goToLoginPage(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      },
      child: const Text(
        login,
        style: TextStyle(fontSize: 18, color: blueColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  FilledButton _signUpButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<SignUpBloc>().add(
              OnSignUp(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
      },
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
        signup,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  TextField _passwordTextField() {
    return TextField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.right,
      obscureText: !showPassword,
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
        fillColor: Colors.white,
      ),
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
}
