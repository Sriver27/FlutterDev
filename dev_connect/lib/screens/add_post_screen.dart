import 'dart:typed_data';

import 'package:dev_connect/models/user.dart';
import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/utils/colors.dart';

import 'package:dev_connect/utils/globalvar.dart';
import 'package:dev_connect/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class addPostScreen extends StatefulWidget {
  const addPostScreen({Key? key}) : super(key: key);

  @override
  _addPostScreenState createState() => _addPostScreenState();
}

class _addPostScreenState extends State<addPostScreen> {
  Uint8List? _file;
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create a new post"),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Take a photo"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Choose a photo from list"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              )
            ],
          );
        });
  }

  List<Requirement> selectedUserList = [];
  void _openFilterDialog() async {
    await FilterListDialog.display<Requirement>(
      context,
      listData: getRequirements,
      selectedListData: selectedUserList,
      choiceChipLabel: (user) => user!.tags,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.tags!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context).getUser;
    print(user.photoUrl);
    return _file == null
        ? Center(
            child: IconButton(
                icon: Icon(Icons.upload),
                onPressed: () => _selectImage(context)))
        : Scaffold(
            appBar: AppBar(
                backgroundColor: mobileBackgroundColor,
                leading:
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                title: const Text("Post To"),
                actions: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("Post",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))
                ]),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/design-pictures-19.jpg"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText:
                                "What's your new requirement ......Just ask!!",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: AspectRatio(
                            aspectRatio: 487 / 451,
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(user.photoUrl),
                                        fit: BoxFit.fill,
                                        alignment:
                                            FractionalOffset.topCenter))))),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Tags: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                        onPressed: _openFilterDialog,
                        child: Icon(Icons.add, color: Colors.white),
                        backgroundColor: Colors.blueAccent),
                    SizedBox(width: 10),
                    selectedUserList == null || selectedUserList.length == 0
                        ? Center(
                            child: Text('No tag selected'),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(selectedUserList[index].toString()),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: selectedUserList.length),
                  ],
                ),
              ],
            ));
  }
}
