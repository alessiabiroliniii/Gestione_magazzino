import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse_app/providers/auth.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Gestione Prodotti",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Text("App per la gestione di prodotto e magazzini"),
            const SizedBox(height: 10),
            const Text("Realizata da Acevedo Martin Thomas"),
            const SizedBox(height: 10),
            const Text("Gruppo PCTO: Acevedo, Birolini e Muraru"),
            const SizedBox(height: 200),
            TextButton(
              onPressed: () async {
                final AuthProvider authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                await authProvider.logout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
