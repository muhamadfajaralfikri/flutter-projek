import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:na/artikel_model.dart';
import 'News_list_page.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routName = '/article_detail';

  final Artikelmodel artikel;
  const ArticleDetailPage({super.key, required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new), // Set your leading icon here
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewsListPage();
                },
              ),
            );
            // Add functionality for the leading icon button
            ;
          },
        ),
        title: Text('Your App Title'), // Set your app title here
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications), // Set your action icon here
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ArticleDetailPage(artikel: artikel);
                  },
                ),
              );
              CoolAlert.show(
                context: context,
                type: CoolAlertType.info,
                text: 'anda berada di halaman ini',
                autoCloseDuration: const Duration(seconds: 2),
              );
              // Add functionality for the action icon button
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 740,
          width: 400,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 627,
                width: 390,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      artikel.description,
                      style: const TextStyle(
                        fontFamily: AutofillHints.birthdayYear,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Image.network(
                      artikel.urlToImage,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(artikel.title),
                    const Divider(color: Colors.grey),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      artikel.content,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Divider(color: Colors.grey),
                          Text('Author: ${artikel.author}.  '),
                          const Divider(color: Colors.grey),
                        ],
                      ),
                    ),
                    Text(
                      'Date: ${artikel.publishedAt} ',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return NewsListPage();
                                      },
                                    ),
                                  );
                                  CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.success,
                                    text: 'kembali kehalaman sebelumnya',
                                    autoCloseDuration:
                                        const Duration(seconds: 2),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: Text(
                                  'kembali',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
