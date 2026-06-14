import 'package:flutter/material.dart';
import 'user_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF7ED5A0),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<UserProfile>(
        future: UserStorage.loadProfile(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF7ED5A0),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildInfoTile(Icons.badge, 'NBI', user.nbi),
                _buildInfoTile(Icons.person, 'Nama', user.name),
                _buildInfoTile(Icons.email, 'Email', user.email),
                _buildInfoTile(Icons.location_on, 'Alamat', user.alamat),
                _buildInfoTile(Icons.camera_alt, 'Instagram', user.instagram),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF7ED5A0)),
      title: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
