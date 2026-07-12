import 'package:flutter/material.dart';
import '../viewmodels/auth_bootstrap_viewmodel.dart';

class AuthBootstrapScreen extends StatefulWidget {
  const AuthBootstrapScreen({super.key});

  @override
  State<AuthBootstrapScreen> createState() => _AuthBootstrapScreenState();
}

class _AuthBootstrapScreenState extends State<AuthBootstrapScreen> {
  final _displayNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _viewModel = AuthBootstrapViewModel();

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _displayNameController.text.trim();
    final email = _emailController.text.trim().isEmpty ? null : _emailController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a display name')));
      return;
    }

    setState(() {});

    final success = await _viewModel.createLocalUser(displayName: name, email: email);
    if (success) {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/tasks');
    } else {
      final msg = _viewModel.error ?? 'Failed to create user';
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Bootstrap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _displayNameController,
              decoration: const InputDecoration(labelText: 'Display name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email (optional)'),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _viewModel,
              builder: (context, _) {
                return ElevatedButton(
                  onPressed: _viewModel.isLoading ? null : _submit,
                  child: _viewModel.isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Create local user'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
