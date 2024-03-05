import 'package:flutter/material.dart';
import 'package:task/src/widgets/colors.dart';
import '../widgets/icons.dart';

class MyProCard extends StatelessWidget {
  const MyProCard({
    Key? key,
    required this.label,
    required this.icon,
    required this.num,
  }) : super(key: key);

  final int num;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: InkWell(
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.38,
            height: MediaQuery.of(context).size.height * 0.13,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Row(
                  children: [
                    MyDefaultIcon(svgFile: icon),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '$num',
                            style: Theme.of(context).textTheme.headlineLarge!,
                          ),
                        ),
                        Text(
                          label,
                          style: Theme.of(context).textTheme.displaySmall!,
                        )
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
