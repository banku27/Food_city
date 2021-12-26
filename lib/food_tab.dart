import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem('Delicious hot dog', 4.0, '60', 'assets/hotdog.png'),
          _buildListItem('Tasty cheese pizza', 4.0, '79', 'assets/pizza.png')
        ],
      ),
    );
  }
}

_buildListItem(String foodName, rating, String price, String img) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 210.0,
          child: Row(
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    color: Color(0XFFFFEEDF),
                    borderRadius: BorderRadius.circular(9)),
                child: Center(
                  child: Image.asset(
                    img,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: GoogleFonts.notoSans(
                        fontSize: 13.0, fontWeight: FontWeight.w400),
                  ),
                  const IconTheme(
                    data: IconThemeData(color: Colors.amber, size: 21),
                    child: StarDisplay(
                      value: 4,
                    ),
                  ),
                  Row(
                    children: [
                      Text("₹" + price,
                          style: GoogleFonts.notoSans(
                              fontSize: 17,
                              color: Colors.red.withOpacity(0.9))),
                      const SizedBox(width: 3),
                      Text("₹99",
                          style: GoogleFonts.notoSans(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFFFE7D6A),
        )
      ],
    ),
  );
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key? key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
