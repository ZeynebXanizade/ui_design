import 'package:design/src/presentation/views/sneakersabouts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectCategory;

  @override
  void initState() {
    super.initState();
    selectCategory = "all";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Shoes",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryButton("All", "all", Colors.grey),
                    buildCategoryButton("Orange", "orange", Colors.orange),
                    buildCategoryButton(
                        "Pink", "pink", Color.fromARGB(255, 136, 14, 79)),
                    buildCategoryButton(
                        "Yellow", "yellow", Color.fromARGB(255, 187, 243, 33)),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              if (selectCategory == "all" || selectCategory == "yellow")
                myItems(
                    image: "assets/images/shoes1_.png",
                    tag: 'yellow',
                    color: Color.fromARGB(255, 187, 243, 33),
                    text: "Yellow",
                    context: context),
              if (selectCategory == "all" || selectCategory == "pink")
                myItems(
                    image: "assets/images/shoes3.png",
                    tag: 'pink',
                    color: Colors.pink[900],
                    text: "Pink",
                    context: context),
              if (selectCategory == "all" || selectCategory == "orange")
                myItems(
                    image: "assets/images/shoes2.png",
                    tag: 'orange',
                    color: Colors.orange,
                    text: "Orange",
                    context: context),
              if (selectCategory == "all" || selectCategory == "green")
                myItems(
                    image: "assets/images/shoes4.png",
                    tag: 'green',
                    color: Colors.green,
                    text: "Green",
                    context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryButton(String title, String category, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectCategory = category;
        });
      },
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: selectCategory == category ? color : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                 decoration: TextDecoration.none,
                color: selectCategory == category ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myItems({image, tag, color, text, context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SneakersAbout(
                      tag: tag,
                          color: color,
                          text: text,
                          image: AssetImage(image),
                        )));
          },
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [Shadow(color: Colors.grey, blurRadius: 10)]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
