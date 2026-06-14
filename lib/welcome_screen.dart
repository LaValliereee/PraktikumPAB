import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'user_storage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Future<UserProfile> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = UserStorage.loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserProfile>(
      future: _profileFuture,
      builder: (context, snapshot) {
        final profile =
            snapshot.data ??
            const UserProfile(
              name: 'Farrel Pramuditya Nugroho',
              nbi: '1462300172',
            );

        return Scaffold(
          backgroundColor: const Color(0xFFF7F7F7),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 374),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE2E2E2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202124),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'PRAKTIKUM PAB 2026',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9E9E9E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      Text(
                        profile.nbi,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7A7A7A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 26),
                      Image.asset(
                        'assets/images/gambar1.jpg',
                        width: 225,
                        height: 225,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 26),
                      Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202124),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 51,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7ED5A0),
                            foregroundColor: Colors.white,
                            elevation: 2,
                            shadowColor: Colors.black.withValues(alpha: 0.18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
