import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InfoItem extends StatelessWidget {
  final bool isLast;
  final IconData icon;
  final String value;
  final bool isVaccinated;

  const InfoItem(
      {Key? key,
      required this.isLast,
      required this.icon,
      this.value = "",
      this.isVaccinated = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {
                    print('Using button');
                  },
                  icon: Icon(
                    icon,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              !isLast
                  ? Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : isVaccinated
                      ? const Icon(MdiIcons.check,
                          color: Colors.white, size: 28)
                      : const Icon(MdiIcons.close, color: Colors.red, size: 28)
            ],
          ),
          if (!isLast)
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 25),
              child: const VerticalDivider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
        ],
      ),
    );
  }
}
