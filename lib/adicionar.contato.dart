import 'package:flutter/material.dart';

class AdicionarContato extends StatelessWidget {
  const AdicionarContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Adicionar Contato',
          style: TextStyle(color: Colors.lightBlueAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'artmannmanuella020@gmail.com',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[200],
              child: IconButton(
                icon: const Icon(Icons.camera_alt, size: 30, color: Colors.white),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
            buildTextField(Icons.person, 'Nome', 'Digite o nome do contato'),
            const SizedBox(height: 16),
            buildTextField(Icons.phone, 'Telefone', 'Digite o número de telefone'),
            const SizedBox(height: 16),
            buildTextField(Icons.email, 'E-mail', 'Digite o e-mail'),
            const SizedBox(height: 16),
            buildTextField(Icons.group, 'Grupos', 'Selecione o grupo'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Visualizar mais',
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String label, String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
