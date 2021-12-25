import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({ Key? key, required this.images }) : super(key: key);
final List<String> images;
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _buildImageCarousel(),
      // _buildDescription(),
      // _buildBottomBar()
    ],
      
    );
  }

  _buildImageCarousel(){
     TabController imagesController =
        TabController(length: widget.images.length, vsync: this);

    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                      return 
                        Image.asset(image);
                      
                    },
                  ).toList(),
                ),
                // Align(
                //   alignment: Alignment.bottomLeft,
                //   child: FloatingActionButton(
                //     elevation: 0,
                //     backgroundColor: Colors.white.withAlpha(0),
                //     //foregroundColor: Theme.of(context).accentColor,
                //     child: Image.asset("images/bee.png",height: 32,),
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => ZoomedImage(
                //                 photos: widget.product
                //                     .images[imagesController.index].imageURL),
                //           ));
                //     },
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: FloatingActionButton(
                //     elevation: 0,
                //     backgroundColor: Colors.white.withAlpha(0),
                //     //foregroundColor: Theme.of(context).accentColor,
                //     child: Icon(Icons.zoom_in),
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => ZoomedImage(
                //                 photos: widget.product
                //                     .images[imagesController.index].imageURL),
                //           ));
                //     },
                //   ),
                // ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
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