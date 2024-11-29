import 'package:flutter/material.dart';
import 'adicionar.contato.dart';
import 'tela.contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactsScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      drawer: DrawerMenu(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contatos',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),
              ProfileHeader(),
              SizedBox(height: 20),
              MeuPerfil(),
              SizedBox(height: 20),
              FavoriteContacts(),
              SizedBox(height: 20),
              OtherContacts(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, color: Colors.blueAccent[100]!),
          ),
          const SizedBox(width: 15),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 48, height: 48),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdicionarContato(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Icon(Icons.search, color: Colors.blueAccent[100]!),
          const SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.blueAccent[100]!),
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20.5),
        children: <Widget>[
          ListTile(
            trailing: Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: const Icon(Icons.settings, size: 30),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person, color: Colors.white),
              backgroundColor: Colors.orange,
            ),
            title: const Text('Todos os contatos'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text('Grupos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person_search_rounded),
            title: const Text('Gerenciar contatos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Lixeira'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MeuPerfil extends StatelessWidget {
  const MeuPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meu perfil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'Manuella Artmann'),
              ),
            );
          },
          child: ContactItem(
            name: 'Manuella Artmann',
            color: Colors.pink[200]!,
            imageUrl: 'https://lh3.googleusercontent.com/a/ACg8ocIFctmzsx_zkoIAsbsT6_iBuVMX55FbSP1PPG3x5mo9WC5ZqbKIAA=s288-c-no',
          ),
        ),
      ],
    );
  }
}

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.star, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text(
              'Favoritos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'Amor'),
              ),
            );
          },
          child: ContactItem(name: 'Amor', color: Colors.pink[200]!),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'Mãe'),
              ),
            );
          },
          child: ContactItem(name: 'Mãe', color: Colors.lightBlue[200]!),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'Pai'),
              ),
            );
          },
          child: ContactItem(name: 'Pai', color: Colors.amber[200]!),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'Rafa'),
              ),
            );
          },
          child: ContactItem(name: 'Rafa', color: Colors.deepPurple[200]!),
        ),
      ],
    );
  }
}

class OtherContacts extends StatelessWidget {
  const OtherContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'A',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'A'),
              ),
            );
          },
          child: const ContactItem(name: 'A', color: Colors.orange),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(contactName: 'B'),
              ),
            );
          },
          child: ContactItem(name: 'B', color: Colors.green[200]!),
        ),
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final Color color;
  final String? imageUrl;

  const ContactItem({Key? key, required this.name, required this.color, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white30,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: color,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? Text(
            name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
              : null,
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
