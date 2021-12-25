import 'package:flutter/material.dart';

import '../styles.dart';

class ListingItem extends StatefulWidget {
  const ListingItem(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.date,
      required this.lending, required this.username})
      : super(key: key);
  final String imageURL;
  final String title;
  final String date;
  final bool lending;
  final String username;
  @override
  _ListingItemState createState() => _ListingItemState();
}

class _ListingItemState extends State<ListingItem> {
  _ListingItemState();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.imageURL,
            width: 60,
            height: 100,
            fit: BoxFit.cover,
          )),
      title: Text(
        widget.title,
        style: TextStyles.h4,
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text(
        widget.date,
        style: TextStyles.body,
      ),
      Text(
        widget.lending?"Rented to ${widget.username}":"Borrowed from ${widget.username}",
        style: TextStyles.body,
      )
      ],),
      isThreeLine: true,
    );
  }
}
