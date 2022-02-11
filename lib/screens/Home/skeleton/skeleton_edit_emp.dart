import 'package:flutter/material.dart';
import 'package:mobile_app/screens/Home/skeleton/constants.dart';

class NewsCardSkeltonEditEmp extends StatelessWidget {
  const NewsCardSkeltonEditEmp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const SizedBox(width: defaultPadding),
            const Skeleton(height: 50, width: 50),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Skeleton(width: 120),
                  const SizedBox(height: defaultPadding / 2),
                  const Skeleton(width: 80),
                ],
              ),
            ),
            const Skeleton(height: 25, width: 25),
            const SizedBox(width: defaultPadding),
          ],
        ),
      ],
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(25))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
