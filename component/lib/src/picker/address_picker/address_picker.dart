import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:theme/theme.dart';

import 'address_result.dart';
import 'area_tree.dart';
import 'china_area.dart';
import '../picker_selection_overlay.dart';
import '../picker_title.dart';

///
class AddressPicker extends StatefulWidget {
  ///
  const AddressPicker(
      {Key? key, this.cancelText, this.confirmText, this.cityStyle})
      : super(key: key);

  final String? cancelText;
  final String? confirmText;
  final TextStyle? cityStyle;

  @override
  AddressPickerState createState() => AddressPickerState();
}

///
class AddressPickerState extends State<AddressPicker> {
  late FixedExtentScrollController _provinceScrollCtrl;
  late FixedExtentScrollController _cityScrollCtrl;
  late FixedExtentScrollController _townScrollCtrl;

  late List<AreaTree> _provinces;
  late AreaTree _selectedProvince;
  late AreaTree _selectedCity;
  late AreaTree _selectedTown;

  @override
  void initState() {
    _provinces = buildTree();
    _selectedProvince = _provinces.first;
    _selectedCity = _selectedProvince.child.first;
    _selectedTown = _selectedCity.child.first;

    _provinceScrollCtrl = FixedExtentScrollController();
    _cityScrollCtrl = FixedExtentScrollController();
    _townScrollCtrl = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _provinceScrollCtrl.dispose();
    _cityScrollCtrl.dispose();
    _townScrollCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()?.addressPickerTheme;
    return Container(
      child: Column(
        children: <Widget>[
          PickerTitle(
            onCancelListener: Navigator.of(context).pop,
            onConfirmListener: () => Navigator.of(context).pop(
              AddressResult(
                _selectedProvince.areaCode,
                _selectedProvince.areaName,
                _selectedCity.areaCode,
                _selectedCity.areaName,
                _selectedTown.areaCode,
                _selectedTown.areaName,
              ),
            ),
            cancelText: widget.cancelText,
            confirmText: widget.confirmText,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _provinceScrollCtrl,
                    itemExtent: theme?.itemExtent ?? 40,
                    childCount: _provinces.length,
                    onSelectedItemChanged: (int index) {
                      _onProvinceChange(_provinces[index]);
                    },
                    selectionOverlay: const PickerSelectionOverlay(),
                    itemBuilder: (_, int index) {
                      return Center(
                        child: Text(
                          _provinces[index].areaName,
                          style: widget.cityStyle ??
                              theme?.cityStyle ??
                              const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _cityScrollCtrl,
                    itemExtent: theme?.itemExtent ?? 40,
                    childCount: _selectedProvince.child.length,
                    onSelectedItemChanged: (int index) {
                      _onCityChange(_selectedProvince.child[index]);
                    },
                    selectionOverlay: const PickerSelectionOverlay(),
                    itemBuilder: (_, int index) {
                      return Center(
                        child: Text(
                          _selectedProvince.child[index].areaName,
                          style: widget.cityStyle ??
                              theme?.cityStyle ??
                              const TextStyle(
                                  color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CupertinoPicker.builder(
                    scrollController: _townScrollCtrl,
                    itemExtent: theme?.itemExtent ?? 40,
                    childCount: _selectedCity.child.length,
                    onSelectedItemChanged: (int index) {
                      _onTownChange(_selectedCity.child[index]);
                    },
                    selectionOverlay: const PickerSelectionOverlay(),
                    itemBuilder: (_, int index) {
                      return Center(
                        child: Text(
                          _selectedCity.child[index].areaName,
                          style: widget.cityStyle ??
                              theme?.cityStyle ??
                              const TextStyle(
                                  color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCityChange(AreaTree city) {
    setState(() {
      Vibrate.feedback(FeedbackType.impact);
      _selectedCity = city;
      if (_selectedCity.areaCode.isNotEmpty) {
        _selectedTown = _selectedCity.child.first;
      }
      _townScrollCtrl.jumpToItem(0);
    });
  }

  void _onProvinceChange(AreaTree province) {
    setState(() {
      Vibrate.feedback(FeedbackType.impact);
      _selectedProvince = province;
      _selectedCity = province.child.first;
      if (_selectedCity.areaCode.isNotEmpty) {
        _selectedTown = _selectedCity.child.first;
      }
      _cityScrollCtrl.jumpToItem(0);
      _townScrollCtrl.jumpToItem(0);
    });
  }

  void _onTownChange(AreaTree town) {
    setState(() {
      Vibrate.feedback(FeedbackType.impact);
      _selectedTown = town;
    });
  }
}
