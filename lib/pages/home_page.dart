part of 'pages.dart';

class ItemMenu {
  final String title;
  final Widget page;
  final IconData? icon;
  ItemMenu({
    required this.title,
    required this.page,
    required this.icon,
  });
}

final List<ItemMenu> listMenu = [
  /* ItemMenu(title: 'Home', page: HomePage()), */
  ItemMenu(
    title: 'Send Message with Sign',
    page: SendMessageWithSignPage(),
    icon: IconsCustom.ic_conversation,
  ),
  ItemMenu(
    title: 'Letter and Numbers',
    page: LetterAndNumbersPage(),
    icon: IconsCustom.ic_words,
  ),
  ItemMenu(
    title: 'Games',
    page: SelectGameMenuPage(),
    icon: IconsCustom.ic_puzzle,
  ),
  /* ItemMenu(title: 'Settings', page: SettingsPage()), */
];

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(0);
    void _onItemTapped(int index) => _selectedIndex.value = index;

    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    return Scaffold(
      body: listMenu.elementAt(_selectedIndex.value).page,
      bottomNavigationBar: BottomNavigationBar(
        items: listMenu
            .map((e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.title,
                ))
            .toList(),
        currentIndex: _selectedIndex.value,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
