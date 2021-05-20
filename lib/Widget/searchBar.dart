import 'package:flutter/material.dart';

import 'package:recipe2/Utils/constants.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;
  TextEditingController searchcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    searchcontroller.addListener(onSearchChanged);
  }

  void dispose() {
    searchcontroller.removeListener(onSearchChanged);
    searchcontroller.dispose();
    super.dispose();
  }

  onSearchChanged() {
    print(searchcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _folded ? 56 : 250,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: whitee,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 36),
              child: !_folded
                  ? TextField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.green),
                          border: InputBorder.none),
                    )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: blackk,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
