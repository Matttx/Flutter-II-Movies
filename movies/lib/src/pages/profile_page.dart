import 'package:flutter/material.dart';
import 'package:movies/src/widgets/profile_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String value = "thomas.hidalgo@epitech.eu";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/profile_screen.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: const EdgeInsets.only(top: 214),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(top: 100, left: 10, right: 10),
                    height: 530,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 33),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        child: const Center(
                          child: Text(
                            "M",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 105, left: 75),
                      child: Image.asset('assets/images/Flag.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Mistoufle40",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const ProfileInformation(),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            right: 220,
                          ),
                          child: const Text(
                            "Email address",
                            style: TextStyle(
                                color: Color(0xFF9E9E9E), fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 30, right: 30),
                          child: TextFormField(
                            initialValue: value,
                            onChanged: (text) {
                              value = text;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF9E9E9E), width: 0.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFF9E9E9E),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: const Text(
                              "Delete my account",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: const Text(
                            "COMING SOON",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFFCED5E3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
