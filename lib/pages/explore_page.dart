import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:iieproject/pages/inbox_page.dart';
import 'package:iieproject/pages/manage_page.dart';
import 'package:iieproject/pages/product_detail_page.dart';
import 'package:iieproject/styles.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late PageController controller;
  int getPageIndex = 0;

  @override
  void initState() {
    controller = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: getPageIndex == 0 ? _buildAppBar() : null,
      body: PageView(
        controller: controller,
        children: <Widget>[_buildBody(), ManagePage(), InboxPage()],
        onPageChanged: _whenPageChanges,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildBottomNavigationBar() {
    return CupertinoTabBar(
      //type: BottomNavigationBarType.fixed,
      currentIndex: getPageIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined),
          // new Image(
          //   image: Icon(Icons.fitness_center),
          //   //AssetImage(getPageIndex==1?"images/exercise_icon_blue.png":"images/exercise_icon.png"),
          //   height: 22,
          // ),
          label: 'Rentals',
        ),
        BottomNavigationBarItem(
            icon: new Icon(Icons.chat_bubble_outline_rounded), label: 'Inbox'),
        BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined), label: 'Profile'),
      ],
      onTap: _onTapChangePage,
      activeColor: Theme.of(context).primaryColor,
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

  _buildBody() {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: [
        Stack(
          children: [
            Container(
              height: 700,
              child: Image.asset(
                'lib/assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              top: null,
              bottom: 130,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Instruments lying around?\nPerfect.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                      SizedBox(height: 24),
                      Container(
                        height: 48,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Go rent",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).primaryColor),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                //side: BorderSide(color: Colors.red)
                              )),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 48),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Current offers near you",
            style: TextStyles.h2,
          ),
        ),
        Container(height: 300, child: _getExampleOffers()),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 24),
          child: Container(
              child: Text(
            "All offers",
            style: TextStyles.link,
          )),
        ),
        SizedBox(height: 48),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Browse per Category",
            style: TextStyles.h2,
          ),
        ),
        Container(
          height: 300,
          child: _getBrowseCategories(),
        )
      ],
    );
  }

  _buildAppBar() {
    return AppBar(
        //     systemOverlayStyle: SystemUiOverlayStyle(
        //   // Status bar color
        //   statusBarColor: Colors.white, // For both Android + iOS

        //   // Status bar brightness (optional)
        //   // statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        //   // statusBarBrightness: Brightness.light, // For iOS (dark icons)
        // ),
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white, filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            contentPadding:
                EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),

            //focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //       color: Theme.of(context).accentColor, width: 1.0),
            // ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(width: 1, color: Colors.black12),
            ),
            labelStyle: TextStyle(
              color: Colors.black87,
            ),

            labelText: "Which instrument do you need?",
          ),
        ));
  }

  _getExampleOffers() {
    return ListView(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(images: [
                      "lib/assets/guitar.jpeg",
                      "lib/assets/guitar.jpeg"
                    ])),
          ),
          child: Container(
            width: 200,
            child: Card(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.asset(
                        "lib/assets/guitar.jpeg",
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Guitar",
                            style: TextStyles.h3.copyWith(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "20 kilometres away",
                            style:
                                TextStyles.body.copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          width: 200,
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.asset(
                      "lib/assets/violin.jpeg",
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Violin",
                          style: TextStyles.h3.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "3 kilometres away",
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
                // Container(
                //   height: 100,
                //   color: Colors.red,
                // )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          width: 200,
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.asset(
                      "lib/assets/piano.png",
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Piano",
                          style: TextStyles.h3.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "5 kilometres away",
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
                // Container(
                //   height: 100,
                //   color: Colors.red,
                // )
              ],
            ),
          ),
        )
      ],
    );
  }

  _getBrowseCategories() {
    return ListView(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Container(
          width: 200,
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.asset(
                      "lib/assets/guitar.jpeg",
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Guitar",
                          style: TextStyles.h3.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "20 kilometres away",
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          width: 200,
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.asset(
                      "lib/assets/violin.jpeg",
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Violin",
                          style: TextStyles.h3.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "3 kilometres away",
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
                // Container(
                //   height: 100,
                //   color: Colors.red,
                // )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          width: 200,
          child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.asset(
                      "lib/assets/piano.png",
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Piano",
                          style: TextStyles.h3.copyWith(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "5 kilometres away",
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
                // Container(
                //   height: 100,
                //   color: Colors.red,
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}
