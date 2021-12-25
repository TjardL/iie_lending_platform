import 'package:flutter/material.dart';
import 'package:iieproject/styles.dart';
import 'package:iieproject/widgets/listing_item.dart';

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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rentals",
              style: TextStyles.h1,
            ),IconButton(onPressed: (){}, icon: Icon(Icons.add),iconSize: 32,)
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
              _buildActive(),

              _buildPrevious(),
              _buildPending(),

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
              "Active",
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
              "Previous",
              style: TextStyles.h4.copyWith(
                decoration: getPageIndex == 1 ? TextDecoration.underline : null,
              ),
            )),
        ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            _onTapChangePage(2);
          },
          child: Text(
            "Pending",
            style: TextStyles.h4.copyWith(
              decoration: getPageIndex == 2 ? TextDecoration.underline : null,
            ),
          ),
        ),
      ],
    );
  }

  _buildActive() {
    return ListView(
      shrinkWrap: true,
      children: [
        ListingItem(
            imageURL: 'lib/assets/guitar.jpeg',
            title: 'Guitar',
            date: '8-31. Dec',
            lending: false,
            username: "Sven"),
        SizedBox(height: 16),
        ListingItem(
            imageURL: 'lib/assets/piano.png',
            title: 'Piano',
            date: '8-12. Dec',
            lending: true,
            username: 'Julia')
      ],
    );
  }

  _buildPrevious() {
    return ListView(
      shrinkWrap: true,
      children: [
        ListingItem(
            imageURL: 'lib/assets/violin.jpeg',
            title: 'Violin',
            date: '8-20. Nov',
            lending: false,
            username: "Hans"),
        SizedBox(height: 16),
        ListingItem(
            imageURL: 'lib/assets/piano.png',
            title: 'Piano',
            date: '1-12. Nov',
            lending: true,
            username: 'Julia'),
        SizedBox(height: 16),
        ListingItem(
            imageURL: 'lib/assets/guitar.jpeg',
            title: 'Guitar',
            date: '1-12. Oct',
            lending: true,
            username: 'Julia'),
        SizedBox(height: 16),
        ListingItem(
            imageURL: 'lib/assets/piano.png',
            title: 'Piano',
            date: '1-12. Nov',
            lending: true,
            username: 'Julia'),
        SizedBox(height: 16),
        ListingItem(
            imageURL: 'lib/assets/guitar.jpeg',
            title: 'Guitar',
            date: '1-12. Oct',
            lending: true,
            username: 'Julia')
      ],
    );
  }

  _buildPending() {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          "No offers are pending.",
          style: TextStyles.body,
        )
      ],
    );
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
