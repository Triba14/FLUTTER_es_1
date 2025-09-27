import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [
    'Termini e condizioni',
    'Informativa sulla privacy',
    'Politica sui cookie',
    'Condizioni di vendita',
    'Garanzia e resi',
    'Assistenza clienti',
    'Domande frequenti',
    'Contatti',
    'Chi siamo',
    'Lavora con noi',
    'Blog',
    'Novità',
    'Eventi',
    'Promozioni',
    'Newsletter',
    'Social media',
    'Sostenibilità',
    'Accessibilità',
    'Sicurezza',
    'Supporto tecnico',
  ];

  List<IconData> icons = [
    Icons.gavel,
    Icons.privacy_tip,
    Icons.cookie,
    Icons.shopping_bag,
    Icons.assignment_return,
    Icons.support_agent,
    Icons.help_outline,
    Icons.contact_mail,
    Icons.info,
    Icons.work,
    Icons.article,
    Icons.new_releases,
    Icons.event,
    Icons.local_offer,
    Icons.email,
    Icons.share,
    Icons.eco,
    Icons.accessibility,
    Icons.security,
    Icons.support,
  ];

  @override
  void initState() {
    super.initState();
  }

  void _showItemDialog(String itemName, int index) {
    print('Card: $itemName, Index: $index');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dettagli'),
          content: Text('Nome: $itemName\nIndice: $index'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Chiudi'),
            ),
          ],
        );
      },
    );
  }

  void _addNewItem() {
    setState(() {
      items.add('Nuovo elemento ${items.length + 1}');
      icons.add(Icons.new_label);
    });
  }

  void _onCancelPressed() {
    print('Bottone Annulla premuto');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('ListView App'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: items.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      tileColor: Colors.blue.shade50,
                      leading: Icon(icons[index]),
                      title: Text(items[index]),
                      subtitle: Text('Sottotitolo ${index + 1}'),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          _showItemDialog(items[index], index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade300,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _onCancelPressed();
                  },
                  child: const Text(
                    'Annulla',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _addNewItem();
                  },
                  child: const Text(
                    'Salva',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
