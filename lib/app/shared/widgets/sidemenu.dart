import 'package:flutter/material.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
                child: Row(
              children: const [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: AssetImage('assets/images/png/homilylogo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Homli',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                selected: true,
                selectedColor: Colors.black,
                selectedTileColor: const Color.fromRGBO(36, 74, 94, 0.1),
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ListTile(
                selected: false,
                selectedColor: Colors.black,
                selectedTileColor: Colors.grey[200],
                leading: const Icon(Icons.person_rounded),
                title: const Text('Profile'),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ListTile(
                selected: false,
                selectedColor: Colors.black,
                selectedTileColor: Colors.grey[200],
                leading: const Icon(Icons.analytics),
                title: const Text('Analytics'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                InkWell(
                    child: Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
                SizedBox(
                  width: 2,
                ),
                Text('Log out'),
                SizedBox(
                  width: 5,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
