import 'package:flutter/material.dart';
import 'package:iieproject/styles.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
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
        Text(
          "Manage",
          style: TextStyles.h1,
        ),
        SizedBox(height: 48),
        Row(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {
                  _onTapChangePage(0);
                },
                child: Text("Active",style: TextStyles.h4.copyWith(decoration:getPageIndex==0? TextDecoration.underline:null,),)),
            ElevatedButton(
                onPressed: () {
                  _onTapChangePage(1);
                },
                child: Text("Previous")),
            ElevatedButton(
                onPressed: () {
                  _onTapChangePage(2);
                },
                child: Text("Pending")),
          ],
        ),
        Divider(thickness: 1.5,),
        //  const TabBarView(
        //     children: [
        //       Icon(Icons.directions_car),
        //       Icon(Icons.directions_transit),
        //       Icon(Icons.directions_bike),
        //     ],),
        Container(
          height: 600,
          child: PageView(
            controller: controller,
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              //_buildActive(),
              // _buildPast(),
              // _buildPending(),

              //PatientFMSPage(),
            ],
            onPageChanged: _whenPageChanges,
          ),
        ),
      ],
    );
  }

  _onTapChangePage(int pageIndex) {
    controller.jumpToPage(pageIndex);
    // controller.animateToPage(pageIndex,
    //     duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  _whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }
}
