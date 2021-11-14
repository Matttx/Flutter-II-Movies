import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies/src/models/user.dart';
import 'package:movies/src/widgets/profile_information.dart';
import 'package:movies/src/controllers/user_controller.dart';
import 'package:movies/blocs/user/user_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  // Todo: Add real JWT from local storage
  final userBloc = UserBloc(jwt: "731b1b6a-7900-4215-8e86-ec3203b72ce4");
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
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
    return Container(
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
                                  style: TextStyle(
                                      color: Color(0xFF9E9E9E), fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 30, right: 30),
                                child: TextFormField(
                                  autocorrect: false,
                                  cursorColor: Theme.of(context).primaryColor,
                                  controller: _controller,
                                  onFieldSubmitted: (value) {
                                    //Todo: Add Real JWT from localstorage
                                    updateUser(
                                        "731b1b6a-7900-4215-8e86-ec3203b72ce4",
                                        value);
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0x409E9E9E), width: 0.0),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0x409E9E9E),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: TextButton(
                                  onPressed: () {
                                    //Todo: Add Real JWT from localstorage
                                    deleteUser(
                                        "b134c06e-d554-489a-b77d-30430457e44b");
                                  },
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
            ]);
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
