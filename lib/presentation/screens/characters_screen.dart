import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../constance/my_colors.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedCharacters;

  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  void addSearchedForItemsToSearcheList(String searchedCharacter) {
    searchedCharacters = allCharacters
        .where((character) => character.name
            .toLowerCase()
            .contains(searchedCharacter.toLowerCase()))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        backgroundColor: MyColors.yellow,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected ? _buildBlocWidget() : _buildNoInternetWidget();
        },
        child: showLoadingIndicator(),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedCharacters[index],
        );
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            if (_searchTextController.text.isEmpty) {
              Navigator.pop(context);
            }
            _clearSearching();
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.grey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearching();
            },
            icon: const Icon(
              Icons.search,
              color: MyColors.grey,
            )),
      ];
    }
  }

  _buildAppBarTitle() {
    return Text(
      'Rick and Morty',
      style: TextStyle(
        color: MyColors.grey,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters!;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget _buildNoInternetWidget() {
    return Center(
      child: Image.asset(
        'assets/images/no-internet.png',
      ),
    );
  }

  _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.grey,
      decoration: InputDecoration(
        hintText: 'Find a Character...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.grey,
          fontSize: 18.sp,
        ),
      ),
      style: TextStyle(
        color: MyColors.grey,
        fontSize: 18.sp,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearcheList(searchedCharacter);
      },
    );
  }

  void _clearSearching() {
    setState(() {
      _searchTextController.clear();
    });
  }

  void _startSearching() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: _stopSearching,
    ));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }
}
