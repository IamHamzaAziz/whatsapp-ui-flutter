import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.teal,

          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade300,

            tabs: const [
              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text('Chats')),
              Tab(child: Text('Status')),
              Tab(child: Text('Calls')),
            ]
          ),

          actions: [
            const Icon(Icons.search, color: Colors.white,),
            const SizedBox(width: 10,),
            PopupMenuButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white,),
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: '1',
                  child: Text('Profile'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('Settings'),
                ),
              ]
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: TabBarView(
          children: [
            const Icon(Icons.camera_alt, size: 50,),

            // Chat
            ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index){
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  // title: Text('GC Member $index'),
                  title: Text('GC Member'),
                  subtitle: const Text('Ki haal ney'),
                  trailing: const Text('3:00 PM'),
                );
              }
            ),

            // Status
            ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index){
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.teal,
                        width: 2
                      )
                    ),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage('https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    ),
                  ),
                  // title: Text('GC Member $index'),
                  title: const Text('Aura Guy'),
                  subtitle: const Text('35 minutes ago'),
                );
              }
            ),

            // Calls
            ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index){
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),

                  title: const Text('Batman'),
                  subtitle: Text(index%2 == 0 ? 'You missed a call' : 'Call time: 3 minutes'),
                  trailing: Icon(index%2 == 0 ? Icons.missed_video_call : Icons.video_call),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

