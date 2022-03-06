import 'dart:io';
import 'dart:typed_data';

import 'package:dev_connect/models/user.dart';
import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/providers/user_provider.dart';
import 'package:dev_connect/resources/fireStore_methods.dart';
import 'package:dev_connect/utils/colors.dart';

import 'package:dev_connect/utils/globalvar.dart';
import 'package:dev_connect/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/colors.dart';
import 'package:dev_connect/utils/utils.dart';

class addPostScreen extends StatefulWidget {
  const addPostScreen({Key? key}) : super(key: key);

  @override
  _addPostScreenState createState() => _addPostScreenState();
}

class _addPostScreenState extends State<addPostScreen> {
  XFile? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(
      var uid, String username, String? profImage, String collegeName) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        username,
        uid,
        collegeName,
        profImage!,
      );
      if (res == "Success") {
        /* 2nd issue */

        setState(() {
          isLoading = false;
        });
        showSnackBar(
          'Posted!',
          context,
        );
        clearImage();
      } else {
        showSnackBar(res, context);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        (err.toString()),
        context,
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
    /* 3rd issue*/
  }

  String _selectedValuesJson = 'Nothing to show';
  late final List<Requirement> selectedUserList;

  @override
  void initState() {
    super.initState();
    selectedUserList = [];
  }

  @override
  void dispose1() {
    selectedUserList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider uSerProvider = Provider.of<userProvider>(context);
    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(
                Icons.upload,
              ),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
                backgroundColor: mobileBackgroundColor,
                leading: IconButton(
                    onPressed: clearImage, icon: Icon(Icons.arrow_back)),
                title: const Text("Post To"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => postImage(
                            uSerProvider.getUser.uid,
                            uSerProvider.getUser.username,
                            uSerProvider.getUser.photoUrl,
                            uSerProvider.getUser.collegeName,
                          ),
                      child: const Text("Post",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)))
                ]),
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(uSerProvider
                                  .getUser.photoUrl !=
                              "null"
                          ? uSerProvider.getUser.photoUrl!
                          : "https://scontent.fdel1-3.fna.fbcdn.net/v/t1.6435-9/180978949_314228950059549_1005358403722529104_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_zKTkCaPFaYAX_YD-2l&_nc_ht=scontent.fdel1-3.fna&oh=00_AT9yABTNblN4pyKoB-ZMlEkdKxXZyAlipowe6XDGm3jWvg&oe=6244FF8E"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText:
                                "What's your new requirement ......Just ask!!",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: FileImage(File(_file!.path)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlutterTagging<Requirement>(
                          initialItems: selectedUserList,
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: blueColor.withAlpha(30),
                              hintText: 'Search Tags',
                              labelText: 'Select Tags',
                            ),
                          ),
                          findSuggestions: RequirementService.getRequirements,
                          additionCallback: (value) {
                            return Requirement(
                              name: value,
                            );
                          },
                          onAdded: (language) {
                            // api calls here, triggered when add to tag button is pressed
                            return language;
                          },
                          configureSuggestion: (lang) {
                            return SuggestionConfiguration(
                              title: Text(lang.name),
                              additionWidget: Chip(
                                avatar: Icon(
                                  Icons.add_circle,
                                  color: primaryColor,
                                ),
                                label: Text('Add New Tag'),
                                labelStyle: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                ),
                                backgroundColor: blueColor,
                              ),
                            );
                          },
                          configureChip: (lang) {
                            return ChipConfiguration(
                              label: Text(lang.name),
                              backgroundColor: blueColor,
                              labelStyle: TextStyle(color: primaryColor),
                              deleteIconColor: primaryColor,
                            );
                          },
                          onChanged: () {
                            setState(() {
                              _selectedValuesJson = selectedUserList
                                  .map<String>((lang) => '\n${lang.toJson()}')
                                  .toList()
                                  .toString();
                              _selectedValuesJson = _selectedValuesJson
                                  .replaceFirst('}]', '}\n]');
                            });
                          }),
                    ),
                  ],
                ),

                /// LanguageService
              ],
            ));
  }
}
