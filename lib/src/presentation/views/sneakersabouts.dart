import 'package:flutter/material.dart';

class SneakersAbout extends StatefulWidget {
  const SneakersAbout(
      {super.key,
      required this.image,
      required this.color,
      required this.text,
      required this.tag});
  final AssetImage image;
  final Color color;
  final String text;
  final String tag;

  @override
  State<SneakersAbout> createState() => _SneakersAboutState();
}

class _SneakersAboutState extends State<SneakersAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: widget.color,
          iconTheme: const IconThemeData(color: Colors.white)),
      body: Hero(
        tag: widget.tag,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color,
            image: DecorationImage(
              image: AssetImage(widget.image.assetName),
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  
                  child: Text(
                    
                    widget.text,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Buy",
                          style: TextStyle(fontSize: 20),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
