import 'package:flutter/material.dart';


class GDropdownItem<T> {
  final T value;
  final String title;
  final Widget? leading;

  GDropdownItem({
    required this.value,
    required this.title,
    this.leading,
  });
}



class GSingleSelectDropdown<T> extends StatefulWidget {
  final String hint;
  final List<GDropdownItem<T>> items;
  final T? selected;
  final ValueChanged<T> onChanged;
  final bool searchable;

  const GSingleSelectDropdown({
    super.key,
    required this.hint,
    required this.items,
    this.selected,
    required this.onChanged,
    this.searchable = false,
  });

  @override
  State<GSingleSelectDropdown<T>> createState() =>
      _GSingleSelectDropdownState<T>();
}

class _GSingleSelectDropdownState<T>
    extends State<GSingleSelectDropdown<T>> {
  late List<GDropdownItem<T>> filtered;
  bool open = false;

  @override
  void initState() {
    super.initState();
    filtered = widget.items;
  }

  void toggle() => setState(() => open = !open);

  @override
  Widget build(BuildContext context) {
    final selectedItem = widget.items
        .where((e) => e.value == widget.selected)
        .cast<GDropdownItem<T>?>()
        .firstOrNull;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Input
        GestureDetector(
          onTap: toggle,
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: open ? Colors.blue : Colors.grey.shade300,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedItem?.title ?? widget.hint,
                    style: TextStyle(
                      color: selectedItem == null
                          ? Colors.grey
                          : Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: open ? .5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.keyboard_arrow_down),
                )
              ],
            ),
          ),
        ),

        /// Dropdown
        if (open)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: Column(
              children: [
                if (widget.searchable)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (v) {
                        setState(() {
                          filtered = widget.items
                              .where((e) => e.title
                                  .toLowerCase()
                                  .contains(v.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),

                SizedBox(
                  height: filtered.length > 5 ? 220 : null,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filtered.length,
                    itemBuilder: (_, i) {
                      final item = filtered[i];
                      final selected = item.value == widget.selected;

                      return InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          widget.onChanged(item.value);
                          setState(() => open = false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            color: selected
                                // ignore: deprecated_member_use
                                ? Colors.blue.withOpacity(.08)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              if (item.leading != null) ...[
                                item.leading!,
                                const SizedBox(width: 10),
                              ],
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: selected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              if (selected)
                                const Icon(Icons.check,
                                    color: Colors.blue, size: 18),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}


