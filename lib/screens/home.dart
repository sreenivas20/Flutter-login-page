//import 'dart:html';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../main.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            if (index % 2 == 0) {
              return ListTile(
                title: Text(
                  'Messi',
                  style: GoogleFonts.concertOne(fontStyle: FontStyle.normal),
                ),
                subtitle: Text(
                  'Message ',
                  style: GoogleFonts.concertOne(fontStyle: FontStyle.normal),
                ),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=http%3A%2F%2Ft0.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcQTBIkxproxJHBsj2ZOkeFr3CYyVJjrfW8qcovw9whTrkRjsqYnBRlprpmyAknfOsug43oiT9iqS9cJe6s&psig=AOvVaw3BZ0qAmFq6SrE0iPYy97aY&ust=1671547171680000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCKjktcz0hfwCFQAAAAAdAAAAABAE'),
                ),
                trailing: Text('1$index:00 PM'),
              );
            } else {
              return ListTile(
                title: Text(
                  'Ronaldo',
                  style: GoogleFonts.concertOne(fontStyle: FontStyle.normal),
                ),
                subtitle: Text(
                  'Message',
                  style: GoogleFonts.concertOne(fontStyle: FontStyle.normal),
                ),
                leading: const ClipRRect(
                  child: Image(
                    width: 60,
                    image: AssetImage('assets/images/ronaldo.jpg'),
                  ),
                ),
                trailing: Text('$index:00 PM'),
              );
            }
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 10,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();

    await _sharedprefs.clear();

    // await _sharedprefs.setBool(SAVE_KEY_NAME, true);

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
