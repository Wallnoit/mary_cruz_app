import 'package:flutter/material.dart';

class InputSearch extends StatefulWidget {
  final Function(String) onChanged;

  const InputSearch({super.key, required this.onChanged});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  get onChanged => widget.onChanged;
  bool isClear = true;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: controller,
          cursorHeight: 20,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            focusColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
            ),
            hintMaxLines: 1,
            contentPadding: const EdgeInsets.all(0),
            hintText: 'Buscar...',
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            suffixIcon: isClear
                ? null
                : IconButton(
                    icon: const Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      onChanged('');
                      controller.clear();
                      setState(() {
                        isClear = true;
                      });
                    },
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              setState(() {
                isClear = true;
              });
            } else {
              setState(() {
                isClear = false;
              });
            }

            onChanged(value);
          },
        ),
      ),
    );
  }
}
