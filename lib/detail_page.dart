import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;
  DetailPage({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: const [
      //     Icon(
      //       Icons.shopping_cart,
      //       size: 28,
      //       color: Color(0xFFFE7D6A),
      //     )
      //   ],
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      // ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 40,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color(0xFFFE7D6A).withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0))
                    ], color: Color(0xFFFE7D6A), shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 4,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Center(
                        child: Text("1",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 11,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Center(
          child: Text(
            widget.foodName.toString().toUpperCase(),
            style: GoogleFonts.notoSans(
                fontSize: 28, fontWeight: FontWeight.w800, color: Colors.brown),
          ),
        ),
        const SizedBox(
          height: 55,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 240,
                  width: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFFE7D6A).withOpacity(0.1),
                                  blurRadius: 6.0,
                                  spreadRadius: 6.0,
                                  offset: Offset(5.0, 11.0)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: const Center(
                            child: Icon(Icons.favorite_border,
                                color: Color(0xFFFE7D6A), size: 25.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFFE7D6A).withOpacity(0.1),
                                  blurRadius: 6.0,
                                  spreadRadius: 6.0,
                                  offset: Offset(5.0, 11.0)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.restore,
                                color: Color(0xFFFE7D6A), size: 25.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                    '₹' +
                        (int.parse(widget.pricePerItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5E6166))),
              ),
            ),
            Container(
              height: 70,
              width: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFFE7D6A)),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.remove, color: Color(0xFFFE7D6A)),
                            onPressed: () {
                              adjustQuantity('MINUS');
                            },
                            color: Colors.white,
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 21.0,
                                color: Color(0xFFFE7D6A),
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.add, color: Color(0xFFFE7D6A)),
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Add to cart',
                        style: GoogleFonts.notoSans(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            children: [
              Text("RECOMMENDED",
                  style: GoogleFonts.notoSans(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 225,
          width: MediaQuery.of(context).size.width,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[_buildListItem('1'), _buildListItem('2')]),
        ),
      ]),
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}

_buildListItem(String columnNumber) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Column(
      children: <Widget>[
        if (columnNumber == '1')
          _buildColumnItem(
              'assets/roll.png', 'Veg frankie', '30', Color(0xFFFBD6F5)),
        if (columnNumber == '1') SizedBox(height: 15.0),
        if (columnNumber == '1')
          _buildColumnItem(
              'assets/popcorn.png', 'Sweet popcorn', '20', Color(0xFFFBD6F5)),
        if (columnNumber == '2')
          _buildColumnItem(
              'assets/falafel.png', 'Falafel', '30', Color(0x94EC9A4D)),
        if (columnNumber == '2') SizedBox(height: 15.0),
        if (columnNumber == '2')
          _buildColumnItem(
              'assets/sandwich.png', 'Sandwich', '40', Color(0x94EC9A4D)),
      ],
    ),
  );
}

_buildColumnItem(String imgPath, String foodName, String price, Color bgColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        width: 210.0,
        child: Row(children: [
          Container(
              height: 75.0,
              width: 75.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0), color: bgColor),
              child: Center(
                  child: Image.asset(imgPath, height: 50.0, width: 50.0))),
          SizedBox(width: 20.0),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(foodName,
                style: GoogleFonts.notoSans(
                    fontSize: 14.0, fontWeight: FontWeight.w400)),
            Text(
              '₹' + price,
              style: GoogleFonts.lato(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  textStyle: TextStyle(color: Color(0xFFF68D7F))),
            ),
          ])
        ]),
      )
    ],
  );
}
