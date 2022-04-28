import 'package:flutter/material.dart';
import 'referenceLink.dart';
import 'home.dart';

class Reference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8E334C),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          color: Color(0xFFEC9454),
        ),
        title: Text(
          ' Reference Material',
          style: TextStyle(color: Color(0xFFEC9454)),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Link1()));
                },
                leading: ExcludeSemantics(
                  child: CircleAvatar(
                    child: Text(
                      '1',
                      style: TextStyle(color: Color(0xFF8E334C)),
                    ),
                    backgroundColor: Color(0xFFEC9454),
                  ),
                ),
                title: Text('WCC'),
                subtitle: Text("Upen Dalal")),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Link2()));
                },
                leading: ExcludeSemantics(
                  child: CircleAvatar(
                    child: Text(
                      '2',
                      style: TextStyle(color: Color(0xFF8E334C)),
                    ),
                    backgroundColor: Color(0xFFEC9454),
                  ),
                ),
                title: Text('Wireless Communication'),
                subtitle: Text("Andreas -f molisch")),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Link3()));
                },
                leading: ExcludeSemantics(
                  child: CircleAvatar(
                    child: Text(
                      '3',
                      style: TextStyle(color: Color(0xFF8E334C)),
                    ),
                    backgroundColor: Color(0xFFEC9454),
                  ),
                ),
                title: Text('UM10360'),
                subtitle: Text("Embedded Systems")),
          ],
        ),
      ),
    );
  }
}
