import 'package:flutter/material.dart';


class ContactScreen extends StatelessWidget {
  final String contactName;

  const ContactScreen({Key? key, required this.contactName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildActionButtons(),
          const SizedBox(height: 20),
          _buildContactList(),
          const SizedBox(height: 20),
          _buildFooterActions(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.purple,
            child: Icon(
              Icons.camera_alt,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            contactName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Celular: +55 54 99178-2624",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
            iconSize: 30,
            color: Colors.blue,
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
            iconSize: 30,
            color: Colors.blue,
          ),
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {},
            iconSize: 30,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildContactList() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          ContactItem(name: 'Grupos', phoneNumber: 'Contatos de emergência'),
          ContactItem(name: 'WhatsApp', phoneNumber: '', height: 50),
          Center(
            child: ContactItem(name: '      Histórico      ', phoneNumber: '', height: 50),
          ),
          Center(
            child: ContactItem(name: '  Locais de Armazenamento   ', phoneNumber: '', height: 50),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterActions() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ContactAction(icon: Icons.star, label: 'Favoritos'),
          _ContactAction(icon: Icons.edit, label: 'Editar'),
          _ContactAction(icon: Icons.share, label: 'Compartilhar'),
          _ContactAction(icon: Icons.more_vert, label: 'Mais'),
        ],
      ),
    );
  }
}

class _ContactAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactAction({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.lightBlueAccent),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final double height;

  const ContactItem({
    Key? key,
    required this.name,
    required this.phoneNumber,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      height: height,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (phoneNumber.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              phoneNumber,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
