import 'package:flutter/material.dart';
import 'package:corven_app/providers/login_provider.dart';
import 'package:corven_app/ui/input_decorations.dart';
import 'package:corven_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 230,
              ),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text('Ingresá a tu cuenta', style: Theme.of(context).textTheme.headline5,),
                    SizedBox(height: 30,),

                    _LoginForm(),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Text('¿No tenés usuario?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
                ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepOrangeAccent,
              onPressed: (){
                FocusScope.of(context).unfocus();

                Navigator.pushReplacementNamed(context, 'home');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  'Crear cuenta' , 
                  style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
              ),
              SizedBox(height: 15,),
              Text('También podes registrarte con:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CircleAvatar( 
                      backgroundImage: AssetImage('assets/google+.png'),),
                  ),
                  IconButton(onPressed: (){}, icon: Image.asset('assets/facebook.png'))

                ],
              ),
              SizedBox(height: 15,)

            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginForm.formKey,

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'corven@ejemplo.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: (value) => loginForm.email = value,
              validator: ( value ){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no luce como un correo';

              },
            ),
            SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => loginForm.password = value,
              validator: ( value ){
                if(value != null && value.length >= 6){

                  return null;
                } else {
                  return 'La contraseña debe ser de 6 caracteres';
                }

              },
            ),
            SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
                ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepOrangeAccent,
              onPressed: loginForm.isLoading ? null : (){
                FocusScope.of(context).unfocus();

                if ( !loginForm.isValidForm() ) {
                  return;
                }
                loginForm.isLoading = true;

                Future.delayed(Duration(seconds: 2));

                loginForm.isLoading = false;

                Navigator.pushReplacementNamed(context, 'home');
                

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Espere' : 'Ingresar' , 
                  style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Olvidaste tu contraseña?' , 
                  style: TextStyle(
                  color: Colors.black
                ),
                ),
              ),
          ],
        )
        ),
    );
  }
}