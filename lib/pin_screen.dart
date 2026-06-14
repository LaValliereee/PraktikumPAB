import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user_storage.dart';
import 'secret_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool _isChecking = false;
  String? _errorText;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _handleUnlock() async {
    final pin = _pinController.text.trim();

    if (pin.isEmpty) {
      setState(() {
        _errorText = 'PIN tidak boleh kosong';
      });
      return;
    }

    setState(() {
      _isChecking = true;
      _errorText = null;
    });

    final isValid = await UserStorage.verifyPin(pin);

    if (!mounted) return;

    if (isValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecretScreen()),
      );
      return;
    }

    setState(() {
      _isChecking = false;
      _errorText = 'PIN salah, coba lagi';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Enter your PIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111111),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Please enter your pin that you have created',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.25,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  const Icon(Icons.lock_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: 168,
                    child: TextField(
                      controller: _pinController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onSubmitted: (_) => _handleUnlock(),
                      decoration: InputDecoration(
                        counterText: '',
                        errorText: _errorText,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Color(0xFF888888),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Color(0xFF4A8DFF),
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 96,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isChecking ? null : _handleUnlock,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A8DFF),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFF9DBEFF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: _isChecking
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.lock_open, size: 28),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
