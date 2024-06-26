import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/models/user.dart';
import 'package:body_fitness_frontend/pages/home/home_page.dart';
import 'package:body_fitness_frontend/pages/register.dart';
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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool usernameError = false;
  bool passwordError = false;

  String usernameErrorText = '';
  String passwordErrorText = '';

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
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: const Text(
                      '¿No tienes una cuenta? Regístrate aquí',
                      style: TextStyle(color: Palette.primaryOrange),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _handleLogin() {
    User user = existUser(usernameController.text);
    setState(() {
      usernameError = usernameController.text.isEmpty;
      passwordError = passwordController.text.isEmpty;

      usernameErrorText = usernameError ? 'Ingrese un Nombre de Usuario' : '';
      passwordErrorText = passwordError ? 'Ingrese una Contraseña' : '';
    });

    if (!usernameError && !passwordError) {
      if (user.id != 0 &&
          user.password.toLowerCase() ==
              passwordController.text.toLowerCase()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        setState(() {
          usernameErrorText = user.id == 0 ? 'El Usuario no Existe' : '';
          passwordErrorText = user.id != 0 &&
                  user.password.toLowerCase() !=
                      passwordController.text.toLowerCase()
              ? 'Contraseña Incorrecta'
              : '';
        });
      }
    }
  }
}
