import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:na/artikel_model.dart';
import 'package:na/forgot_passwordpage.dart';
import 'article_detail_page.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 53, 195, 176),
              Color.fromARGB(255, 235, 235, 235),
            ],
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordpage();
                              },
                            ),
                          );
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            text: 'kembali kehalaman lupa password',
                            autoCloseDuration: const Duration(seconds: 2),
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue.shade400),
                        child: const Text(
                          'lupa passsword? ',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Info Perilisan Anime Terbaru',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Adjust font weight as needed
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/artikel.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator()); // While loading
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data')); // On error
                } else {
                  final List<Artikelmodel> artikel =
                      parseArticles(snapshot.data);
                  return ListView.builder(
                    itemCount: artikel.length,
                    itemBuilder: (context, index) {
                      return _buildArticelItem(
                        context,
                        artikel[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ]),
      ),
    ));
  }

  Widget _buildArticelItem(BuildContext context, Artikelmodel artikel) {
    return Center(
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
        child: Card(
          elevation: 20.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 80.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(artikel.urlToImage),
                          fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      artikel.judul,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                    Text(
                      artikel.author,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      artikel.rating,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      artikel.publishedAt,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 0),
                      padding: EdgeInsets.all(4.5),
                      width: 90,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ArticleDetailPage(artikel: artikel)),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        child: Text(
                          'baca',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
