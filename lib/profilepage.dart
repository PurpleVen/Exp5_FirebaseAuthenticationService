import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loginpage/main.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  int accessLevel = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Color(0xfff6a046),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xfff6a046),
                Color(0xff0d3e4e),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/woman.png'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Vendra Sekar",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "TE IT Student",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.mail),
                    title: Text(
                      "Email ID",
                      style: TextStyle(
                        color: Color(0xfff6a046),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_circle_right),
                    subtitle: Text(
                      "venven@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                Divider(),
                ListTile(
                    leading: Icon(Icons.cloud),
                    title: Text(
                      "Github ID",
                      style: TextStyle(
                        color: Color(0xfff6a046),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_circle_right),
                    subtitle: Text(
                      "https://github.com/PurpleVen",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                Divider(),
                ListTile(
                    leading: Icon(Icons.link),
                    title: Text(
                      "LinkedIn ID",
                      style: TextStyle(
                        color: Color(0xfff6a046),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_circle_right),
                    subtitle: Text(
                      "www.linkedin.com/in/vendra-sekar-9999",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                Divider(),
                ListTile(
                  leading: Icon(Icons.text_increase),
                  title: Text(
                    "Data Access Level",
                    style: TextStyle(
                      color: Color(0xfff6a046),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '$accessLevel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                // Navigate to login page
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.arrow_back, size: 18),
              label: Text(
                "LogOut",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfff6a046),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.thumb_up,
            ),
            label: "Like",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down),
            label: "Dislike",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: "Comment",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            accessLevel += 1;
          });
        },
        backgroundColor: Color(0xfff6a046),
        child: Icon(Icons.move_up),
      ),
    );
  }
}
