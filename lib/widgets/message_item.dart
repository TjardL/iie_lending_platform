import 'package:flutter/material.dart';

import '../styles.dart';

class MessageItem extends StatefulWidget {
  const MessageItem(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.date,
      required this.status, required this.message, required this.offering})
      : super(key: key);
  final String imageURL;
  final String name;
  final String date;
  final String status;
  final String message;
  final String offering;
  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  _MessageItemState();
  @override
  Widget build(BuildContext context) {
    return ListTile(contentPadding: EdgeInsets.all(8),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.asset(
            widget.imageURL,
            width: 60,
            height: 100,
            fit: BoxFit.cover,
          )),
      title: Row(
        children: [
          Text(
            widget.name,
            style: TextStyles.h4,
          ),
          Text(
            " • ${widget.offering}",
            style: TextStyles.body,
          ),
        ],
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [SizedBox(height:4),
        Text(
        widget.message,
        style: TextStyles.body.copyWith(color:Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,
      ),
      SizedBox(height:4),
      Text(
        "${widget.status} • ${widget.date}",
        style: TextStyles.body,
      )
      ],),
      isThreeLine: true,
    );
  }
}
