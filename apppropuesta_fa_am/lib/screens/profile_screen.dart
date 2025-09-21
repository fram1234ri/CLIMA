import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Perfil')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Usuario RecipeNow',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Configuración',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Modo oscuro'),
              trailing: Switch(value: false, onChanged: (value) {}),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
              trailing: Text('Español', style: TextStyle(color: Colors.grey)),
              onTap: () {},
            ),
            SizedBox(height: 32),
            Text(
              'Acerca de',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Versión'),
              trailing: Text('1.0.0', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Calificar aplicación'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
