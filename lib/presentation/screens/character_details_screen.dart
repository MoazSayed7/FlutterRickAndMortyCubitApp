import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../constance/my_colors.dart';
import '../../data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQoute();

    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                        'Status : ',
                        character.status,
                      ),
                      buildDivider(
                        250.w,
                      ),
                      characterInfo(
                        'Origin : ',
                        character.origin.name,
                      ),
                      buildDivider(
                        260.w,
                      ),
                      characterInfo(
                        'Location : ',
                        character.location.name,
                      ),
                      buildDivider(
                        250.w,
                      ),
                      characterInfo(
                        'Species : ',
                        character.species,
                      ),
                      buildDivider(
                        250.w,
                      ),
                      characterInfo(
                        'Gender : ',
                        character.gender,
                      ),
                      buildDivider(
                        260.w,
                      ),
                      characterInfo(
                        'Sub Species : ',
                        character.type.isNotEmpty ? character.type : 'unknown',
                      ),
                      buildDivider(
                        210.w,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState?>(
                        builder: (context, state) {
                          return _checkIfQouteIsLoaded(state);
                        },
                      ),
                      SizedBox(
                        height: 500.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildDivider(double endIndent) {
    return Divider(
      color: MyColors.yellow,
      height: 30.h,
      endIndent: endIndent,
      thickness: 2.h,
    );
  }

  characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.white,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }

  _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 460.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(character.name,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Color.fromARGB(50, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _checkIfQouteIsLoaded(CharactersState? state) {
    if (state is QouteLoaded?) {
      return _displayQouteOrEmptySpace(state!);
    } else {
      return _showProgressIndicator();
    }
  }

  Widget _displayQouteOrEmptySpace(QouteLoaded? state) {
    var qoute = (state)!.qoutes;
    if (qoute!.isNotEmpty) {
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19.sp,
            color: MyColors.white,
            shadows: const [
              Shadow(
                blurRadius: 7,
                color: MyColors.yellow,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                qoute[0].text,
                speed: const Duration(milliseconds: 80),
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }
}
