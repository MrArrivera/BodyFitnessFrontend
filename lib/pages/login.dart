import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/models/user.dart';
import 'package:body_fitness_frontend/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import '../requests/users.dart';

List<User> users = [];

void fetchUsers() async {
  users = await getUsers();
  for (var user in users) {
    print(user.name);
  }
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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    setState(() {
      _isLoading = true;
    });

    fetchUsers();

    setState(() {
      _isLoading = false;
    });
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Nombre de Usuario',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Contraseña',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _handleLogin();
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('¿No tienes una cuenta? Regístrate aquí'),
                  ),
                ],
              ),
      ),
    );
  }

  void _handleLogin() {
    User user = existUser(usernameController.text);
    if (user.id != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
