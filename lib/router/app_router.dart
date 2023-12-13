import 'package:asl/models/models.dart';
import 'package:go_router/go_router.dart';
import '../pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/select_difficulty_page',
  /* refreshListenable: goRouterNotifier, */
  routes: [
    ///* Primera pantalla
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/letter-and-numbers',
      builder: (context, state) => LetterAndNumbersPage(),
    ),
    GoRoute(
      path: '/letter-and-numbers/detail',
      builder: (context, state) {
        final sing = state.extra as Sign;
        return LetterAndNumbersPageDetail(sing: sing);
      },
    ),
    GoRoute(
      path: '/send_message_with_sign_page',
      builder: (_, __) => const SendMessageWithSignPage(),
    ),
    GoRoute(
        path: '/select_game_menu_page',
        builder: (_, __) => SelectGameMenuPage()),
    GoRoute(
        path: '/select_difficulty_page',
        builder: (_, state) {
          /* final game = state.extra as SelectGameCard; */
          return SelectDifficultyPage(/* game: game */);
        }),
  ],
);
