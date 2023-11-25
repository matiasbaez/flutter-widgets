
import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon
  });

}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Animated', subtitle: 'Some flutter widgets', link: '/animated', icon: Icons.animation_outlined),
  MenuItem(title: 'App Tutorial', subtitle: 'Some flutter widgets', link: '/tutorial', icon: Icons.account_tree),
  MenuItem(title: 'Buttons', subtitle: 'Some flutter buttons', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Cards', subtitle: 'Some flutter cards', link: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'Infinite Scroll', subtitle: 'Some flutter widgets', link: '/infinite', icon: Icons.circle_outlined),
  MenuItem(title: 'Progress', subtitle: 'Some flutter widgets', link: '/progress', icon: Icons.circle_outlined),
  MenuItem(title: 'Snackbar', subtitle: 'Some flutter widgets', link: '/snackbar', icon: Icons.snapchat),
  MenuItem(title: 'Ui Controls', subtitle: 'Some flutter widgets', link: '/uicontrols', icon: Icons.settings),
];
