import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies/src/models/user.dart';
import 'package:movies/src/pages/login_screen.dart';
import 'package:movies/src/widgets/profile_information.dart';
import 'package:movies/src/controllers/user_controller.dart';
import 'package:movies/blocs/user/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  // Todo: Add real JWT from local storage

  final userBloc = UserBloc(jwt: "");
  final TextEditingController _controller = TextEditingController();

  Future<void> getSharedPrefs() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? jwt = s.getString("jwt");
    if (jwt != null) {
      userBloc.jwt = jwt;
    }
  }

  Future<void> deleteAccount() async {
    deleteUser(http.Client(), userBloc.jwt);
    SharedPreferences s = await SharedPreferences.getInstance();
    s.remove("jwt");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ),
    );
  }

  @override
  void initState() {
    getSharedPrefs();
    userBloc.userEventSink.add(UserAction.Fetch);
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: _controller.text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<User>(
          stream: userBloc.user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _controller.text = snapshot.data!.email;
              return Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 330),
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
                  margin: const EdgeInsets.only(top: 25),
                  height: 617,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 40,
                          left: 10,
                          right: 10,
                        ),
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
                      _UserPicture(snapshot),
                      _UserFlag(),
                      _ProfileDetails(snapshot),
                    ],
                  ),
                ),
              ]);
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _UserPicture(snapshot) => Align(
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
            child: Center(
              child: Text(
                snapshot.data!.username.isNotEmpty
                    ? snapshot.data!.username[0].toUpperCase()
                    : "?",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _UserFlag() => Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 65, left: 75),
          child: Image.asset('assets/images/Flag.png'),
        ),
      );

  Widget _ProfileDetails(snapshot) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    snapshot.data!.username,
                    style: const TextStyle(
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
                    style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
                  ),
                ),
                _EmailInput(),
                _Delete(),
                _ComingSoon()
              ],
            ),
          ),
        ],
      );

  Widget _EmailInput() => Container(
        margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: TextFormField(
          autocorrect: false,
          cursorColor: Theme.of(context).primaryColor,
          controller: _controller,
          onFieldSubmitted: (value) {
            updateUser(http.Client(), userBloc.jwt, value);
          },
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0x409E9E9E), width: 0.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            filled: true,
            fillColor: const Color(0x409E9E9E),
          ),
        ),
      );

  Widget _Delete() => Container(
        margin: const EdgeInsets.only(top: 15),
        child: TextButton(
          onPressed: () {
            deleteAccount();
          },
          style: TextButton.styleFrom(
            primary: Colors.red,
          ),
          child: const Text(
            "Delete my account",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );

  Widget _ComingSoon() => Container(
        margin: const EdgeInsets.only(top: 65),
        child: const Text(
          "COMING SOON",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFCED5E3),
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
