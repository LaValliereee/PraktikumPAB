import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecretScreen extends StatefulWidget {
  const SecretScreen({super.key});

  @override
  State<SecretScreen> createState() => _SecretScreenState();
}

class _SecretScreenState extends State<SecretScreen> {
  List<dynamic> _users = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchSecretData();
  }

  Future<void> _fetchSecretData() async {
    try {
      final response = await http.get(
        Uri.parse('https://randomuser.me/api/?results=20'),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _users = data['results'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Gagal memuat data rahasia.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Terjadi kesalahan jaringan.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secret Members'),
        backgroundColor: const Color(0xFF7ED5A0),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF7ED5A0).withOpacity(0.1),
              const Color(0xFFE0F7F0),
            ],
          ),
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF7ED5A0)),
              )
            : _errorMessage != null
            ? Center(child: Text(_errorMessage!))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          user['picture']['thumbnail'],
                        ),
                      ),
                      title: Text(
                        '${user['name']['first']} ${user['name']['last']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(user['email']),
                      trailing: const Icon(
                        Icons.verified_user,
                        color: Color(0xFF7ED5A0),
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
