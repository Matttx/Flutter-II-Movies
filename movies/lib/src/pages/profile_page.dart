import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 50, left: 330), // HERE
          child: IconButton(
            onPressed: () {
              print("Button pen");
            },
            icon: const Icon(
              MdiIcons.pencil,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 25),
          height: 617,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                  left: 10,
                  right: 10,
                ), // HERE
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F8FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 0),
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
                  margin: const EdgeInsets.only(top: 65, left: 75),
                  child: Image.asset('assets/images/Flag.png'),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 120),
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
                            cursorColor: Theme.of(context).primaryColor,
                            initialValue: value,
                            onChanged: (text) {
                              value = text;
                            },
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0x409E9E9E), width: 0.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: Color(0x409E9E9E),
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
                          margin: const EdgeInsets.only(top: 65),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
