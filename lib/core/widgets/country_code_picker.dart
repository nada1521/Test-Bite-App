import 'package:flutter/material.dart';

class CountryCode {
  final String code;
  final String name;
  final String dialCode;
  final String flag;

  CountryCode({
    required this.code,
    required this.name,
    required this.dialCode,
    required this.flag,
  });

  @override
  String toString() => "$flag $name ($dialCode)";
}

/// لستة الدول (ممكن تزود أو تعدل)
final List<CountryCode> countryCodes = [
  CountryCode(code: "EG", name: "Egypt", dialCode: "+20", flag: "🇪🇬"),
  CountryCode(code: "SA", name: "Saudi Arabia", dialCode: "+966", flag: "🇸🇦"),
  CountryCode(code: "US", name: "United States", dialCode: "+1", flag: "🇺🇸"),
  CountryCode(
    code: "AE",
    name: "United Arab Emirates",
    dialCode: "+971",
    flag: "🇦🇪",
  ),
];

/// الويجت المبسط
class CountryCodePicker extends StatefulWidget {
  final ValueChanged<CountryCode>? onChanged;
  final CountryCode? initialSelection;

  const CountryCodePicker({super.key, this.onChanged, this.initialSelection});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  late CountryCode selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelection ?? countryCodes.first;
  }

  void _openDialog() async {
    final result = await showDialog<CountryCode>(
      context: context,
      builder: (_) => CountryCodeDialog(selected: selected),
    );

    if (result != null) {
      setState(() {
        selected = result;
      });
      widget.onChanged?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDialog,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(selected.flag, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 5),
          Text(selected.dialCode, style: const TextStyle(fontSize: 16)),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

/// Dialog اختيار الدولة
class CountryCodeDialog extends StatefulWidget {
  final CountryCode selected;

  const CountryCodeDialog({super.key, required this.selected});

  @override
  State<CountryCodeDialog> createState() => _CountryCodeDialogState();
}

class _CountryCodeDialogState extends State<CountryCodeDialog> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    final filtered = countryCodes
        .where(
          (c) =>
              c.name.toLowerCase().contains(search.toLowerCase()) ||
              c.dialCode.contains(search),
        )
        .toList();

    return AlertDialog(
      title: const Text("Select Country"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search country",
            ),
            onChanged: (val) => setState(() => search = val),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, index) {
                final country = filtered[index];
                return ListTile(
                  leading: Text(
                    country.flag,
                    style: const TextStyle(fontSize: 20),
                  ),
                  title: Text("${country.name} (${country.dialCode})"),
                  onTap: () => Navigator.pop(context, country),
                  selected: country.code == widget.selected.code,
                );
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
