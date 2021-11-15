import 'package:flutter/material.dart';
import 'package:movies/src/widgets/info_item.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Container(
        child: Row(
          children: const [
            InfoItem(
              isLast: false,
              icon: MdiIcons.cakeVariant,
              value: "24",
            ),
            InfoItem(
              isLast: false,
              icon: IconData(0xe0e3, fontFamily: 'MaterialIcons'),
              value: "A+",
            ),
            InfoItem(
              isLast: true,
              icon: MdiIcons.needle,
              isVaccinated: false,
            ),
          ],
        ),
      ),
    );
  }
}
