import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';

class NavigationListItem extends StatelessWidget {
  final String? title;
  final Function() onPressed;
  const NavigationListItem({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
         decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          blurRadius: 2,
        )
      ]),
      child: ListTile(
        title: Text(
          title!,
          style: const TextStyle(color: Colors.white)
        ),
      ),
      ),
    );
  }
}



class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const NavigationSubListItem({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
         decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          blurRadius: 2,
        )
      ]),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w.toDouble()),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white)
        ),
      ),
      ),
    );
  }
}

