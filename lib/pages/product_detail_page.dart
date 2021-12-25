import 'package:flutter/material.dart';
import 'package:iieproject/styles.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.images}) : super(key: key);
  final List<String> images;
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.ios_share_rounded,
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.favorite_border_rounded,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0),
              children: [
                _buildImageCarousel(),
                _buildDescription(),
              ],
            ),
          ),
          _buildBottomBar()
        ],
      ),
    );
  }

  _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Professional Guitar",
            style: TextStyles.h1,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                "  4,5 / 5 (100 Reviews) • Enschede, Netherlands",
                style: TextStyles.body,
              )
            ],
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 8),
          Text(
            "Description",
            style: TextStyles.h4,
          ),
          SizedBox(height: 8),
          Text(
            "Professional Guitar in perfect condition. Barely\nused because I have too many instruments.",
            style: TextStyles.body,
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 24),
          ListTile(
            leading: Icon(
              Icons.sell_outlined,
            ),
            title: Text(
              "Open to sell",
              style: TextStyles.h4,
            ),
            subtitle: Text(
              "You can also buy this instrument",
              style: TextStyles.body,
            ),
          ),SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
            ),
            title: Text(
              "Flexible date",
              style: TextStyles.h4,
            ),
            subtitle: Text(
              "Extend the rent anytime",
              style: TextStyles.body,
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomBar() {
    return Material(
      elevation: 3,
      child: Container(
        height: 100,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '37€ ',
                      style: TextStyles.h4,
                      children: <TextSpan>[
                        TextSpan(text: '/ week', style: TextStyles.body),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "4 Jan - 11 Jan 2022",
                    style: TextStyles.link,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    height: 50,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Reserve",
                      style: TextStyle(fontSize: 20),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _buildImageCarousel() {
    TabController imagesController =
        TabController(length: widget.images.length, vsync: this);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 350.0,
        child: Center(
          child: DefaultTabController(
            length: widget.images.length,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: widget.images.map(
                    (image) {
                      return Image.asset(image);
                    },
                  ).toList(),
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Theme.of(context).primaryColor,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
