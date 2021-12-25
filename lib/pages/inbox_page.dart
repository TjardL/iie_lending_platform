import 'package:flutter/material.dart';
import 'package:iieproject/widgets/message_item.dart';

import '../styles.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({ Key? key }) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
 late PageController controller;
  int getPageIndex = 0;

  @override
  void initState() {
    controller = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24, top: 62, right: 24),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Inbox",
              style: TextStyles.h1,
            ),//IconButton(onPressed: (){}, icon: Icon(Icons.add),iconSize: 32,)
          ],
        ),
        SizedBox(height: 48),
        _buildPageView(),
        Divider(
          thickness: 1.5,
        ),
        Container(
          height: 600,
          child: PageView(
            controller: controller,
            children: <Widget>[
              _buildMessages(),

              _buildNotifications(),
              

              //PatientFMSPage(),
            ],
            onPageChanged: _whenPageChanges,
          ),
        ),
      ],
    );
  }

  _buildPageView() {
    return Row(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              _onTapChangePage(0);
            },
            child: Text(
              "Messages",
              style: TextStyles.h4.copyWith(
                decoration: getPageIndex == 0 ? TextDecoration.underline : null,
              ),
            )),
        ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              _onTapChangePage(1);
            },
            child: Text(
              "Notifications",
              style: TextStyles.h4.copyWith(
                decoration: getPageIndex == 1 ? TextDecoration.underline : null,
              ),
            )),
        
      ],
    );
  }

  _buildMessages() {
    return ListView(
      shrinkWrap: true,
      children: [
        MessageItem(
            imageURL: 'lib/assets/sven.jpg',
            name: 'Sven',
            date: '8-31. Dec 2021',
            status: "Active Rental",
            message: "If you are interested in buying the instrument if you like it, that is very possible.", offering: 'Guitar',),
        SizedBox(height: 16),
        MessageItem(
            imageURL: 'lib/assets/Frank.jpg',
            name: 'Frank',
            date: '8-12. Dec 2021',
            status: "Previous Rental",
            message: 'Thank you again for the seamless process, let me know whenever you need it again.', offering: 'Piano',)
      ],
    );
  }
  _buildNotifications() {
    return Center(child: Text("You're all caught up",style: TextStyles.h4,),);
  }

  


  _onTapChangePage(int pageIndex) {
    //controller.jumpToPage(pageIndex);
    controller.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  _whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }
}