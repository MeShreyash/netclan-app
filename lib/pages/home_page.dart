import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netclan_app/main.dart';
import 'package:netclan_app/pages/network_page.dart';
import 'package:netclan_app/pages/refine_page.dart';
import 'package:netclan_app/widget/info_card.dart';

import '../widget/bottom_navbar.dart';
import 'chat_page.dart';
import 'contact_page.dart';
import 'explore_page.dart';
import 'groups_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedTabIndex = ref.watch(selectedBottomTabIndexProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: appBarColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Harry Root',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RefinePage()),
                  );
                },
                icon: Icon(Icons.checklist_sharp),
              ),
              Text(
                'Refine',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
      body: _buildBodyContent(selectedTabIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedTabIndex,
        onTap: (index) {
          selectedTabIndex =
              ref.watch(selectedBottomTabIndexProvider.notifier).state = index;
        },
        items: [
          BottomNavBarTab(
            Icons.explore,
            'Explore',
            HomePage(),
          ),
          BottomNavBarTab(
            Icons.connect_without_contact_rounded,
            'Network',
            NetworkPage(),
          ),
          BottomNavBarTab(
            Icons.chat_rounded,
            'Chat',
            ChatPage(),
          ),
          BottomNavBarTab(
            Icons.contact_page_outlined,
            'Contacts',
            ContactPage(),
          ),
          BottomNavBarTab(
            Icons.account_tree_rounded,
            'Groups',
            GroupsPage(),
          ),
        ],
      ),
    );
  }

  // Widget _buildBodyContent(int selectedTabIndex) {
  //   switch (selectedTabIndex) {
  //     case 0:
  //       return ExplorePage();
  //     case 1:
  //       return _buildNetworkPage();
  //     case 2:
  //       return ChatPage();
  //     case 3:
  //       return ContactPage();
  //     case 4:
  //       return GroupsPage();
  //     default:
  //       return Container();
  //   }
  // }

  // Widget _buildNetworkPage() {
  //   return NetworkPage(); // Return the actual NetworkPage instance
  // }

  Widget _buildBodyContent(int selectedTabIndex) {
    return IndexedStack(
      index: selectedTabIndex,
      children: [
        _buildExplorePage(), // HomePage content
        _buildNetworkPage(), // NetworkPage content
        _buildChatPage(), // ChatPage content
        _buildContactPage(), // ContactPage content
        _buildGroupsPage(), // GroupsPage content
      ],
    );
  }

  Widget _buildExplorePage() {
    return ExplorePage();
  }

  Widget _buildNetworkPage() {
    return NetworkPage(); // Return the actual NetworkPage instance
  }

  Widget _buildChatPage() {
    return ChatPage(); // Return the actual ChatPage instance
  }

  Widget _buildContactPage() {
    return ContactPage(); // Return the actual ContactPage instance
  }

  Widget _buildGroupsPage() {
    return GroupsPage(); // Return the actual GroupsPage instance
  }
}
