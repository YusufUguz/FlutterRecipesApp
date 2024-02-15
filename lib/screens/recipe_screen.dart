import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/models/recipe_model.dart';
import 'package:recipes_app/services/db_service.dart';
import 'package:recipes_app/widgets/carousel_slider_indicator.dart';
import 'package:recipes_app/widgets/recipes_screen_details_column.dart';
import 'package:recipes_app/widgets/vertical_divider.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final CarouselController _controller = CarouselController();
  int currentPage = 0;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = (widget.recipe.favoriMi == 1) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    final List<String?> images = [
      widget.recipe.mainImage,
      widget.recipe.image1,
      widget.recipe.image2,
      widget.recipe.image3,
    ];

    String metinMalzemeler = widget.recipe.malzemeler!;
    List<String> malzemelerParcali = metinMalzemeler.split(',');

    String metinAdimlar = widget.recipe.adimlar!;
    List<String> adimlarParcali = metinAdimlar.split('#');

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(widget.recipe.favoriMi == 1
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () {
              int newFavoriteValue = isFavorite ? 0 : 1;
              DatabaseService()
                  .updateFavorite(widget.recipe.tarifID!, newFavoriteValue);
              setState(() {
                widget.recipe.favoriMi = newFavoriteValue;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 226, 190, 190),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        widget.recipe.yemekIsim!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lumanosimo",
                        ),
                      ),
                    ),
                  ),
                ),
                if (images.any((element) => element != null))
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount:
                        images.where((element) => element != null).length,
                    itemBuilder: (context, index, realIndex) {
                      final nonNullImages =
                          images.where((element) => element != null).toList();
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(nonNullImages[index]!),
                      );
                    },
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                    ),
                  ),
                if (images.any((element) => element != null))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: CarouselSliderIndicator(
                      images: images
                          .where((element) => element != null)
                          .map((e) => e!)
                          .toList(),
                      currentPage: currentPage,
                    ),
                  ),
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 206, 206),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RecipeScreenDetailsColumn(
                          text: 'Kaç Kişilik',
                          dataText: '${widget.recipe.kacKisilik} Kişi',
                          widget: widget,
                        ),
                        const DetailsVerticalDivider(),
                        RecipeScreenDetailsColumn(
                          text: 'Yapılış Süresi',
                          dataText: '${widget.recipe.yapilisSuresi} Dakika',
                          widget: widget,
                        ),
                        const DetailsVerticalDivider(),
                        RecipeScreenDetailsColumn(
                          text: 'Yapılış Zorluğu',
                          dataText: '${widget.recipe.yapilisZorlugu}',
                          widget: widget,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Malzemeler',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (var parca in malzemelerParcali)
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, bottom: 7, top: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.circle,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Text(
                            parca,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Adımlar',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (var parca in adimlarParcali)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.check,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Text(
                            parca,
                            softWrap: true,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
