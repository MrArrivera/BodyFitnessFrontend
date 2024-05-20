import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/models/user.dart';
import 'package:body_fitness_frontend/pages/login.dart';
import 'package:flutter/material.dart';
import '../requests/users.dart';

List<User> users = [];

void fetchUsers() async {
  users = await getUsers();
}

User existUser(username) {
  User? userFound = users.firstWhere(
      (user) => user.name.toLowerCase() == username.toString().toLowerCase(),
      orElse: () => User(id: 0, name: "1", password: "0"));

  return userFound;
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  bool isLoading = false;
  bool usernameError = false;
  bool passwordError = false;
  bool passwordConfirmationError = false;

  String usernameErrorText = '';
  String passwordErrorText = '';
  String passwordConfirmationErrorText = '';

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    setState(() {
      isLoading = true;
    });

    fetchUsers();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryOrange,
        title: const Text("BODY FITNESS",
            style:
                TextStyle(color: Palette.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  /*const Image(
                    image: AssetImage('assets/images/body_fitness_logo.jpg'),
                    width: double
                        .infinity, // Ancho de la imagen que ocupa todo el ancho de la pantalla
                    height: 150, // Alto deseado de la imagen
                    fit: BoxFit
                        .cover, // Ajuste de la imagen para cubrir el ancho especificado
                  ),*/
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: 'Nombre de Usuario',
                        errorText: usernameErrorText,
                        errorStyle: const TextStyle(color: Colors.red)),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      errorText: passwordErrorText,
                      errorStyle: const TextStyle(color: Colors.red),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: passwordConfirmationController,
                    decoration: InputDecoration(
                        hintText: 'Confirmar Contraseña',
                        errorText: passwordConfirmationErrorText,
                        errorStyle: const TextStyle(color: Colors.red)),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _handleLogin();
                    },
                    child: const Text('Iniciar sesión',
                        style: TextStyle(color: Palette.primaryOrange)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      '¿Ya tienes Una Cuenta? Inicia Sesion',
                      style: TextStyle(color: Palette.primaryOrange),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _handleLogin() async {
    User user = existUser(usernameController.text);
    setState(() {
      usernameError = usernameController.text.isEmpty;
      passwordError = passwordController.text.isEmpty;
      passwordConfirmationError = passwordConfirmationController.text.isEmpty;

      usernameErrorText = usernameError ? 'Ingrese un Nombre de Usuario' : '';
      passwordErrorText = passwordError ? 'Ingrese una Contraseña' : '';
      passwordConfirmationErrorText =
          passwordConfirmationError ? 'Confirme la Contraseña' : '';
    });

    if (!usernameError && !passwordError && !passwordConfirmationError) {
      if (user.id != 0) {
        usernameErrorText = 'El Usuario Ya Existe';
      } else {
        if (passwordController.text.toLowerCase() ==
            passwordConfirmationController.text.toLowerCase()) {
          postUser(usernameController.text, passwordController.text);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        } else {
          passwordConfirmationErrorText = 'No Coinciden las Contraseñas';
        }
      }
    }
  }
}
