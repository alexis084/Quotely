import 'package:flutter/material.dart';
import 'package:twitter_app/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  String quoteToDisplay = '';
  int count = 0;

  var quotes = [
    'He who has a why to live can bare almost any how',
    'Take into account that great love and great achievements involve great risk',
    'Lost time is never found again',
    'He that respects himself is safe from others',
    'Don\'t take life too seriously, you\'re not getting out alive',
    'Wise men speak because they have something to say',
    'I was born not knowing and have had only a little time to change that here and there.',
    'I\'m smart enough to know that I\'m dumb.'
  ];

  void _chooseQoute() {
    String q = '';
    switch (count) {
      case 0:
        {
          q = quotes[0];
        }
        break;
      case 1:
        {
          q = quotes[1];
        }
        break;
      case 2:
        {
          q = quotes[2];
        }
        break;
      case 3:
        {
          q = quotes[3];
        }
        break;
      case 4:
        {
          q = quotes[4];
        }
        break;
      case 5:
        {
          q = quotes[5];
        }
        break;
      case 6:
        {
          q = quotes[6];
        }
        break;
      case 7:
        {
          q = quotes[7];
        }
        break;
      default:
        {
          q = 'No more wisdom to share log out';
        }
    }
    setState(() {
      quoteToDisplay = q;
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click the button to generate wisdom'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          quoteToDisplay,
          style: TextStyle(
            color: Colors.grey[800],
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Log Out Below'),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () async {
                _auth.signOut();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: _chooseQoute,
      ),
    );
  }
}
