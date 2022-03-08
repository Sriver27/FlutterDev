import 'package:dev_connect/models/user.dart';
import 'package:dev_connect/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class commentsCard extends StatelessWidget {
  final snap;
  const commentsCard({Key? key, required this.snap}) : super(key: key);

  /* @override
  State<commentsCard> createState() => _commentsCardState();
}

class _commentsCardState extends State<commentsCard> {*/
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context).getUser;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(snap.data()['profilePic']),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: snap.data()['name'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '  ${snap.data()['text']}',
                          )
                        ])),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                              DateFormat.yMMMd().format(
                                snap.data()['datePublished'].toDate(),
                              ),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12)),
                        )
                      ])),
            )
          ],
        ));
  }
}
