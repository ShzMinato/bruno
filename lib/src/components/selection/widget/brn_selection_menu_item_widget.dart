import 'package:bruno/src/constants/brn_asset_constants.dart';
import 'package:bruno/src/theme/configs/brn_selection_config.dart';
import 'package:bruno/src/utils/brn_tools.dart';
import 'package:flutter/material.dart';

typedef void ItemClickFunction();

// ignore: must_be_immutable
class BrnSelectionMenuItemWidget extends StatelessWidget {
  final String title;
  final bool isHighLight;
  final int index;
  final bool active;
  final ItemClickFunction itemClickFunction;

  BrnSelectionConfig themeData;

  BrnSelectionMenuItemWidget(
      {@required this.title,
      this.isHighLight = false,
      this.index,
      this.active = false,
      this.itemClickFunction,
      this.themeData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _menuItemTapped();
        },
        child: Container(
          color: Colors.transparent,
          constraints: BoxConstraints.expand(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Flexible(
                child: Text(
                  this.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                  style: isHighLight
                      ? themeData.menuSelectedTextStyle?.generateTextStyle()
                      : themeData.menuNormalTextStyle?.generateTextStyle(),
                ),
              )),
              Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: isHighLight
                      ? (active
                          ? BrunoTools.getAssetImageWithBandColor(BrnAsset.ICON_ARROWUP_SELECT,
                              configId: themeData.configId)
                          : BrunoTools.getAssetImageWithBandColor(BrnAsset.ICON_ARROWDOWN_SELECT))
                      : (active
                          ? BrunoTools.getAssetImageWithBandColor(BrnAsset.ICON_ARROWUP_SELECT,
                              configId: themeData.configId)
                          : BrunoTools.getAssetImage(BrnAsset.ICON_ARROWDOWN_UNSELECT))
                  )
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

  void _menuItemTapped() {
    if (this.itemClickFunction != null) {
      this.itemClickFunction();
    }
  }
}
