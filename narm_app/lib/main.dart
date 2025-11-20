import 'package:flutter/material.dart';

void main() {
  runApp(NarmApp());
}

class NarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NARM',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      routes: {
        '/brinquedos': (_) => CategoryPage(title: 'Brinquedos'),
        '/alimentacao': (_) => CategoryPage(title: 'Alimentação'),
        '/adestramento': (_) => CategoryPage(title: 'Adestramento'),
        '/saude': (_) => CategoryPage(title: 'Saúde física e mental'),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<_CardItem> items = [
    _CardItem('Brinquedos', '/brinquedos', Icons.toys),
    _CardItem('Alimentação', '/alimentacao', Icons.restaurant),
    _CardItem('Adestramento', '/adestramento', Icons.pets),
    _CardItem('Saúde física e mental', '/saude', Icons.favorite),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NARM')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            Text('Seu app para cuidados com o seu amigo de quatro patas!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            ...items.map((i) => Card(
                  child: ListTile(
                    leading: Icon(i.icon),
                    title: Text(i.title),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () => Navigator.pushNamed(context, i.route),
                  ),
                )),
            SizedBox(height: 20),
            Text('PDF original: /mnt/data/NARM.pdf'),
          ],
        ),
      ),
    );
  }
}

class _CardItem {
  final String title;
  final String route;
  final IconData icon;
  _CardItem(this.title, this.route, this.icon);
}

class CategoryPage extends StatelessWidget {
  final String title;
  CategoryPage({required this.title});

  @override
  Widget build(BuildContext context) {
    final content = _contentFor(title);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: content.map((s) => Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(s, style: TextStyle(fontSize: 16)),
          )).toList()
        ),
      ),
    );
  }

  List<String> _contentFor(String title) {
    // Conteúdo extraído (resumido) do PDF fornecido
    switch (title) {
      case 'Brinquedos':
        return [
          'Brincar é essencial para o desenvolvimento físico e mental dos gatos e cães. Estimula o instinto, alivia o stress e fortalece o vínculo com o tutor.',
          'Sugestões de links de compra estão incluídas no PDF original.'
        ];
      case 'Alimentação':
        return [
          'Informações por porte (Pequeno, Médio, Grande) com frequências e recomendações nutricionais.',
          'ALIMENTAÇÃO SAUDÁVEL deve conter: Proteínas, gorduras boas, vitaminas e minerais (taurina é essencial para gatos).',
          'Cães não podem ingerir: chocolate, uva, uva passa, cebola, alho, café, chá, ossos cozidos, açúcar, bebidas alcoólicas, abacate.'
        ];
      case 'Adestramento':
        return [
          'Adestramento de gatos: reforço positivo (petiscos, brinquedos, elogios). Sessões curtas e respeitar tempo/espaco do felino.',
          'Adestramento de cães: comandos básicos (sentar, ficar, vir) com reforço positivo. Treinos curtos e consistentes.'
        ];
      case 'Saúde física e mental':
        return [
          'Ansiedade: sinais como latir/miar demais, tremer, se esconder, destruir objetos. Rotina, passeios e, se preciso, procurar veterinário.',
          'Depressão: sinais como isolamento, dormir demais, falta de interesse. Oferecer atenção, estímulos e procurar profissional se persistir.'
        ];
      default:
        return ['Conteúdo não encontrado'];
    }
  }
}