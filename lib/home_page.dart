import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'util.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isList = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff30BA9D),
        systemNavigationBarColor: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xff30BA9D),
        title: Text(
          "FESTIVAL POST",
          style: TextStyle(
            color: Color(0xffF3DC6E),
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: isList,
            onChanged: (value) {
              isList = value;
              setState(() {});
            },
          ),
        ],
      ),
      body: isList ? MyListView() : MyGridView(),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  List<Map<String, dynamic>> founduser = [];

  void initState() {
    founduser = festivalList;
    super.initState();
  }

  void runfilter(String enterkey) {
    List<Map<String, dynamic>> result = [];
    if (enterkey.isEmpty) {
      result = festivalList;
    } else {
      result = festivalList
          .where((element) =>
              element["text"].toLowerCase().contains(enterkey.toLowerCase()))
          .toList();
    }
    setState(() {
      founduser=result;
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                runfilter(value);
              },
              decoration: InputDecoration(
                hintText: "🔍︎ Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          founduser.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: founduser.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "edit_page",
                      arguments: founduser[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 400,
                    color: Color(0xffAEC3A4),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Image.network(
                              founduser[index]["img"] ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                founduser[index]["text"] ?? "",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Edit Your Festival Post",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
              : Text(
            "Not found",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}


class MyGridView extends StatefulWidget {
  const MyGridView({super.key});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: festivalList.length,
      itemBuilder: (context, index) {
        var fes = festivalList[index];
        return SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "edit_page", arguments: fes);
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    child: Image.network(
                      "${fes["img"] ?? ""}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${fes["text"] ?? ""}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}
