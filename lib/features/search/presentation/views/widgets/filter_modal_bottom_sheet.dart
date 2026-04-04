import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/generated/l10n.dart';

Future<String?> showFilterBottomSheet(
  BuildContext context, {
  String initialValue = "",
}) {
  String selectedValue = initialValue;

  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      final s = S.of(context);
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                Text(
                  s.sortBy,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                RadioGroup<String>(
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val!;
                    });
                  },
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text(s.priceLowToHigh),
                        value: "lowToHigh",
                      ),
                      RadioListTile(
                        title: Text(s.priceHighToLow),
                        value: "highToLow",
                      ),
                      RadioListTile(
                        fillColor: WidgetStateProperty.all(Colors.red),
                        title: Text(
                          s.clearSort,
                          style: TextStyle(color: Colors.red),
                        ),
                        value: "reset",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, selectedValue);
                    },
                    child: Text(
                      s.filter,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
