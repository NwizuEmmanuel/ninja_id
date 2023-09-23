import "package:flutter/material.dart";

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const NinjaID(),
    );
  }
}

class NinjaID extends StatefulWidget {
  const NinjaID({super.key});

  @override
  State<NinjaID> createState() => _NinjaIDState();
}

class _NinjaIDState extends State<NinjaID> {
  int ninjaLevel = 0;

  void increaseNinjaLevel(BuildContext context) {
    setState(() {
      if (ninjaLevel >= 12){
        ScaffoldMessenger.of(context).showSnackBar(snackBar());
      }else{
        ninjaLevel += 1;
      }
    });
  }

  SnackBar snackBar() {
    const snackBar = SnackBar(
      content: Text('No need you already a super ninja.'),
    );
    return snackBar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ninja ID',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img.png'),
                radius: 60.0,
              ),
            ),
            const ListTile(
              title: Text('NAME', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Chun-Li',
                style:
                    TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ListTile(
              title: const Text(
                'CURRENT NINJA LEVEL',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '$ninjaLevel',
                style: const TextStyle(
                    color: Colors.lightGreenAccent, fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              title: Text(
                'chunli77@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> increaseNinjaLevel(context),
        backgroundColor: Colors.grey[850],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
