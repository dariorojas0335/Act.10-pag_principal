import 'package:flutter/material.dart';

void main() => runApp(const DariosBuildingsApp());

class DariosBuildingsApp extends StatelessWidget {
  const DariosBuildingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dario's Buildings",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de navegación personalizada
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Builder(
          builder: (context) => IconButton(
            // Icono de hamburguesa solicitado
            icon: const Icon(Icons.menu, color: Colors.black54), 
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: const [
            Text(
              "Dario's Buildings",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            // Ilustración/Icono de pared de ladrillos
            Icon(Icons.foundation, color: Colors.white),
          ],
        ),
      ),
      
      // Drawer (Barra lateral) en gris claro
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text("Menú Principal", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(leading: Icon(Icons.home), title: Text("Inicio")),
              ListTile(leading: Icon(Icons.build), title: Text("Servicios")),
              ListTile(leading: Icon(Icons.contact_mail), title: Text("Contacto")),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen que abarca todo el ancho
            Image.network(
              'https://raw.githubusercontent.com/dariorojas0335/Act.10-pag_principal/main/img1.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Nuestros Proyectos",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            // Widgets de proyectos construidos
            _buildProjectCard(
              "Residencial Las Palmas",
              "Casa de lujo con acabados en mármol y sistema de energía solar integrado.",
              "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&q=60&w=400",
            ),
            _buildProjectCard(
              "Edificio SkyTower",
              "Complejo de 20 pisos con diseño vanguardista en el centro financiero.",
              "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=60&w=400",
            ),
            _buildProjectCard(
              "Oficinas EcoWorking",
              "Espacios colaborativos diseñados para maximizar la luz natural y el confort.",
              "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=60&w=400",
            ),
          ],
        ),
      ),
    );
  }

  // Función para crear los widgets de proyectos de forma eficiente
  Widget _buildProjectCard(String title, String description, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Imagen a la izquierda
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Descripción a la derecha
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}