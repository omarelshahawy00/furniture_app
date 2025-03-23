class NavBarItem {
  final String title;
  final String icon;
  final String filledIcon;
  final String route;

  const NavBarItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.filledIcon,
  });

  factory NavBarItem.fromMap(Map<String, dynamic> map) {
    return NavBarItem(
      filledIcon: map['filledIcon'],
      icon: map['icon'],
      title: map['title'],
      route: map['route'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filledIcon': filledIcon,
      'icon': icon,
      'title': title,
      'route': route,
    };
  }
}
