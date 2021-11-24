import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Card(
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: const Center(child: const Text('计数器'))),
              color: Colors.teal[100],
            ),
            Card(
              child: const Text('Heed not the rabble'),
              color: Colors.teal[200],
            ),
            Card(
              child: const Text('Sound of screams but the'),
              color: Colors.teal[300],
            ),
            Card(
              child: const Text('Who scream'),
              color: Colors.teal[400],
            ),
            Card(
              child: const Text('Revolution is coming...'),
              color: Colors.teal[500],
            ),
            Card(
              child: const Text('Revolution, they...'),
              color: Colors.teal[600],
            ),
          ],
        ));

    // Container(
    //     child: ListView(
    //   children: const <Widget>[
    //     Card(child: ListTile(title: Text('One-line ListTile'))),
    //     Card(
    //       child: ListTile(
    //         leading: FlutterLogo(),
    //         title: Text('One-line with leading widget'),
    //       ),
    //     ),
    //     Card(
    //       child: ListTile(
    //         title: Text('One-line with trailing widget'),
    //         trailing: Icon(Icons.more_vert),
    //       ),
    //     ),
    //     Card(
    //       child: ListTile(
    //         leading: FlutterLogo(),
    //         title: Text('One-line with both widgets'),
    //         trailing: Icon(Icons.more_vert),
    //       ),
    //     ),
    //     Card(
    //       child: ListTile(
    //         title: Text('One-line dense ListTile'),
    //         dense: true,
    //       ),
    //     ),
    //     Card(
    //       child: ListTile(
    //         leading: FlutterLogo(size: 56.0),
    //         title: Text('Two-line ListTile'),
    //         subtitle: Text('Here is a second line'),
    //         trailing: Icon(Icons.more_vert),
    //       ),
    //     ),
    //     Card(
    //       child: ListTile(
    //         leading: FlutterLogo(size: 72.0),
    //         title: Text('Three-line ListTile'),
    //         subtitle:
    //             Text('A sufficiently long subtitle warrants three lines.'),
    //         trailing: Icon(Icons.more_vert),
    //         isThreeLine: true,
    //       ),
    //     ),
    //   ],
    // ));
  }
}
