/*
  final String serverUrl = 'http://10.0.2.2:3000';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$serverUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userList = jsonDecode(response.body);
      final List<User> users = userList.map((user) {
        return User.fromJson(user);
      }).toList();
      return users;
    } else {
      throw Exception("Failed to fetch items");
    }
  }



Expanded(
          child: FutureBuilder<List<User>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final user = snapshot.data![index];
                    return ListTile(
                      title: Text(user.name),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No users found"),
                );
              }
            },
          ),
        ),*/