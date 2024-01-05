part of '../pages.dart';

class SelectDifficultyPage extends HookWidget {
  final String gameTitle;
  final String? gameRouteDestinyPage;
  final IconData? iconGame;
  const SelectDifficultyPage({
    super.key,
    this.gameRouteDestinyPage,
    this.iconGame,
    required this.gameTitle,
  });

  @override
  Widget build(BuildContext context) {
    final _movieCardPageController = usePageController(viewportFraction: .77);

    final _movieCardPage = useState<double>(0.0);
    final _movieCardIndex = useState<int>(0);

    _movieCardPagePercentListener() {
      _movieCardPage.value = _movieCardPageController.page!;
    }

    useEffect(() {
      _movieCardPageController.addListener(() {
        _movieCardPage.value = _movieCardPageController.page!;
      });
      return () {
        _movieCardPageController.removeListener(_movieCardPagePercentListener);
      };
    }, []);
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final h = constraints.maxHeight;
          final w = constraints.maxWidth;
          return Stack(children: [
            SafeArea(
              child: Positioned(
                left: 0,
                top: 0,
                child: BackIcon(
                  margin: EdgeInsets.all(10),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: FadeIn(
                duration: Duration(milliseconds: 1000),
                child: Icon(
                  iconGame,
                  size: 175,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SimpleText(
                    text: gameTitle.snakeCaseToWords().toCapitalize(),
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    lineHeight: 1,
                  ),
                  SimpleText(
                    text: "Selecciona una dificultad",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  SizedBox(
                    height: h * 0.45,
                    child: Swiper(
                      loop: false,
                      viewportFraction: 0.65,
                      itemCount: Difficulty.values.length,
                      itemBuilder: (context, index) {
                        final difficulty = Difficulty.values[index];
                        return CardDifficulty(
                          difficulty: difficulty,
                          onTap: (Difficulty selectedDiff) {
                            context.push(
                              '/games/$gameRouteDestinyPage',
                              extra: selectedDiff,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}

class CardDifficulty extends StatelessWidget {
  final Difficulty difficulty;
  final Function(Difficulty selectedDiff) onTap;

  const CardDifficulty({
    super.key,
    required this.difficulty,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(difficulty),
      child: Card(
          color: colorByDifficulty[difficulty],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SimpleText(
                text: difficulty.name.toUpperCase(),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Icon(
                  iconByDifficulty[difficulty],
                  size: 75,
                  color: Colors.white,
                ),
              ),
              Wrap(
                children: generateListToMessageUtil(listAllSign,
                        difficulty.name.removeDiacriticsFromString())
                    .map((e) => IconAndLetter(e: e))
                    .toList(),
              ),
            ],
          )),
    );
  }
}

class IconAndLetter extends StatelessWidget {
  final Sign e;
  const IconAndLetter({
    super.key,
    required this.e,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          e.iconSign,
          size: 30,
          color: Colors.white,
        ),
        SimpleText(
          text: e.letter,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          color: Colors.white,
        ),
      ],
    );
  }
}
