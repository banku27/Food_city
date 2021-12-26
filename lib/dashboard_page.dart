import 'package:flutter/material.dart';
import 'package:food_city/detail_page.dart';
import 'package:food_city/food_tab.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0))
                    ],
                    color: const Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage("assets/profile.png"),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
          Text(
            "SEARCH FOR \nFOOD",
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 22, color: Colors.red),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: GoogleFonts.notoSans(fontSize: 14),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.3),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text("Top Picks for you!!",
              style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.green)),
          const SizedBox(height: 15.0),
          Container(
            height: 200.0,
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              _buildListItem('Cake', 'assets/cake1.png', '319',
                  const Color(0x9FDBD6DA), const Color(0xC7975E13)),
              _buildListItem('Burger', 'assets/burger.png', '99',
                  const Color(0xFFFFE9C6), const Color(0xFFDA9551)),
              _buildListItem('Fries', 'assets/fries.png', '35',
                  const Color(0xFFC2E3FE), const Color(0xFF6A8CAA)),
              _buildListItem('Sandwich', 'assets/sandwich.png', '40',
                  const Color(0x91C0DF52), const Color(0xFF307427)),
              _buildListItem('Donuts', 'assets/doughnut.png', '74',
                  const Color(0xFFD7FADA), const Color(0xFF56CC7E)),
            ]),
          ),
          const SizedBox(height: 15.0),
          Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  labelStyle: GoogleFonts.notoSans(
                      fontSize: 16.0, fontWeight: FontWeight.w700),
                  unselectedLabelStyle: GoogleFonts.notoSans(
                      fontSize: 12.0, fontWeight: FontWeight.w500),
                  tabs: const [
                    Tab(child: Text('FEATURED')),
                    Tab(child: Text('COMBO')),
                    Tab(child: Text('FAVORITES')),
                    Tab(child: Text('RECOMMENDED')),
                  ])),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(controller: tabController, children: const [
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
            ]),
          )
        ]),
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          //ToDo
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                  heroTag: foodName,
                  foodName: foodName,
                  pricePerItem: price,
                  imgPath: imgPath)));
        },
        child: Container(
          height: 175,
          width: 135,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(
                    imgPath,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(foodName,
                  style: GoogleFonts.notoSans(fontSize: 17, color: textColor)),
              Text("₹" + price,
                  style: GoogleFonts.notoSans(fontSize: 17, color: textColor))
            ],
          ),
        ),
      ),
    );
  }
}
