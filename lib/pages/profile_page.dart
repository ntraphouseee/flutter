import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView( // ✅ Tambahkan ini
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40), // beri padding atas bawah
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto Profil
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://i.pinimg.com/1200x/83/e8/18/83e8181aa8b9ed23dad5ba5823367a79.jpg'),
              ),
              const SizedBox(height: 20),

              // Nama
              const Text(
                'Aldestha Nendrayanto',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Email
              Text(
                'aldesthanendra413@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),

              // Informasi Lain
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Username'),
                        subtitle: Text('Geenzxz'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Telepon'),
                        subtitle: Text('+62 123 1234 1234'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('Alamat'),
                        subtitle: Text('Kudus, Jawa Tengah, Indonesia'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Edit Profil
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: navigasi ke halaman edit profil
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),

              const SizedBox(height: 40), // ✅ Tambahkan jarak bawah agar tidak mepet
            ],
          ),
        ),
      ),
    );
  }
}
