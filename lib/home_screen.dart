import 'package:flutter/material.dart';
import 'package:whatsapp_ui/main.dart';

void main() {
  runApp(const MyApp());
}

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white, fontFamily: 'Rubic2'),
          ),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            tabs: [
              Tab(child: Icon(Icons.camera_alt,color: Colors.white,)),
              Tab(child: Text('Chats',style: TextStyle(
                color: Colors.white
              ),)),
              Tab(child: Text('Status',style: TextStyle(
                  color: Colors.white
              ))),
              Tab(child: Text('Calls',style: TextStyle(
                  color: Colors.white
              ))),
            ],
          ),
          actions: [
            const Icon(Icons.search_sharp),
            const SizedBox(width: 10),
            PopupMenuButton(
              child: const Icon(Icons.more_vert_rounded),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  // value: '1',
                  child: Text('New group'),
                ),
                const PopupMenuItem(
                  // value: '2',
                  child: Text('New chats'),
                ),
                const PopupMenuItem(
                  // value: '3',
                  child: Text('Logout'),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(
          children: [
            Text('Camera'),
            ListView.builder(
                itemCount: 40,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600')
                    ),
                    title: Text('Amy'),
                    subtitle: Text(index%2==0 ? "Where are you?" : "Party at 11:30"),
                    trailing: Text('6:26 PM',style: TextStyle(
                      fontSize: 15,
                    ),),
                  );
                }),
            ListView.builder(
                itemCount: 40,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.teal,width: 3
                        )
                      ),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600')
                      ),
                    ),
                    title: Text('Amy'),
                    subtitle: Text(index%2==0 ? "40m ago" : "1hr ago"),

                  );
                }
                ),


              ListView.builder(
                itemCount: 40,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600')
                    ),
                    title: Text('Amy'),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Icon(index%2==0 ? Icons.phone_callback_outlined :Icons.video_call_rounded,size: 20,color: Colors.red
                          ),
                        SizedBox(width: 4),
                        Text(index%2==0 ? "Missed Voice Call" : "Missed Video Call")
                      ],
                    ),
                    trailing: Text(index%2==0 ? '6:26 PM' : "7:20 PM",style: TextStyle(
                      fontSize: 16,
                    ),),
                  );
                }),

          ],
        ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){},
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.phone,color: Colors.black,
              ),
            ),
      )),
    );
  }
}
