import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_colors.dart';

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
                const Text(
                  "ترتيب حسب :",
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
                        title: Text("السعر ( الأقل إلى الأعلى )"),
                        value: "lowToHigh",
                      ),
                      RadioListTile(
                        title: Text("السعر ( الأعلى إلى الأقل )"),
                        value: "highToLow",
                      ),
                      RadioListTile(
                        title: const Text("الأحدث"),
                        value: "newest",
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
                    child: const Text(
                      "تصفية",
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
