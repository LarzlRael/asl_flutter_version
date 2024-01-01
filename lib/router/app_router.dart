import 'package:asl/models/models.dart';
import 'package:go_router/go_router.dart';
import '../pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/send_message_with_sign_page',
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
      path: '/letter-and-numbers/detail/:letter',
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
        path: '/select_difficulty_page/:gameTitle/:gameDestinty',
        builder: (_, state) {
          final gameTitle = state.params['gameTitle'];
          final gameDestinty = state.params['gameDestinty'];
          return SelectDifficultyPage(
            gameTitle: gameTitle!,
            gameRouteDestinyPage: gameDestinty,
          );
        }),
    GoRoute(
      path: '/settings_page',
      builder: (_, __) => const SettingsPage(),
    ),

    GoRoute(
      path: '/games',
      builder: (_, __) => const SelectGameMenuPage(),
      routes: [
        GoRoute(
          path: 'test_your_memory_page',
          builder: (_, state) {
            final difficulty = state.extra as Difficulty;
            return TestYourMemoryPage(
              difficulty: difficulty,
            );
          },
        ),
        GoRoute(
          path: 'word_in_sight_page',
          builder: (_, __) => const WordInSightPage(),
        ),
        GoRoute(
          path: 'guess_the_word_page',
          builder: (_, __) => const GuessTheWordPage(),
        ),
        GoRoute(
          path: 'flipping_cards_page',
          builder: (_, state) {
            final difficulty = state.extra as Difficulty;
            return FlippingCardGame(
              difficulty: difficulty,
            );
          },
        ),
      ],
    ),
  ],
);
