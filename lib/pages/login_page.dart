import 'package:flutter/material.dart';
import 'package:netflix/providers/providers.dart';
import 'package:netflix/widgets/widgets.dart';
import 'package:netflix/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 220,),
              CardContainerWidget(
                child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Text('Login', style: Theme.of(context).textTheme.headline4),
                      const SizedBox(height: 30,),
                      ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(),
                          child: const _LoginForm()
                      )
                    ],
                ),
              ),
              const SizedBox(height: 50,),
              const Text('Crear nueva cuenta', style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      )
    );
  }
}


class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKeyLogin,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'juan@gmail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icons.email
            ),
            onChanged: (value) {
              loginForm.email = value;
            },
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'No es un email válido';
            },
          ),
          const SizedBox(height: 30,),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '************',
                labelText: 'Password',
                prefixIcon: Icons.password
            ),
            onChanged: (value) {
              loginForm.password = value;
            },
            validator: (value) {
              return (value != null && value.length >5) ? null : 'La clave debe contener min 5 caracteres';
            },
          ),
          const SizedBox(height: 30,),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            disabledColor: Colors.grey,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(loginForm.isSaving ? 'Espere ... ' : 'Ingresar',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              if(!loginForm.isValidForm()) return;
              loginForm.isSaving = true;
              await Future.delayed(const Duration(seconds: 3));
              loginForm.isSaving = false;
              Navigator.pushReplacementNamed(context, 'home');
            },
          )
        ],
      ),
    );
  }
}
