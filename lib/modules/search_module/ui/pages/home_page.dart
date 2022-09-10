import 'package:flutter/material.dart';

import '../../helpers/api.dart';
import '../../helpers/search.dart';
import '../../model/user_model.dart';
import 'detail_page.dart';

class HomePageSearchModule extends StatefulWidget {
  @override
  _HomePageSearchModuleState createState() => _HomePageSearchModuleState();
}

class _HomePageSearchModuleState extends State<HomePageSearchModule> {
  final FetchUserList _userList = FetchUserList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UserList'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: const Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<Userlist>>(
              future: _userList.getuserList(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        address: data?[index].address,
                                        balance: 'Sin saldo',
                                        company: data?[index].company,
                                        email: data?[index].email,
                                        name: data?[index].name,
                                        phone: data?[index].phone,
                                        website: data?[index].website,
                                      )));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${data?[index].id}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data?[index].name}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '${data?[index].email}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ])
                                ],
                              ),
                              // trailing: Text('More Info'),
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
