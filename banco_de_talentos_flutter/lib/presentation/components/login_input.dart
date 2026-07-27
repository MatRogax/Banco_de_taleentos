import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginInput extends StatefulWidget {
  final String label;
  final IconData icon;
  final String placeholder;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? errorText;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const LoginInput({
    super.key,
    required this.label,
    required this.icon,
    required this.placeholder,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.autofillHints,
    this.textInputAction,
    this.inputFormatters,
  });

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late bool _obscureText;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w600, 
              fontSize: 14,
              color: _isFocused ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: _isFocused ? Theme.of(context).colorScheme.surface : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isFocused 
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
                    : Colors.black.withOpacity(0.02),
                blurRadius: _isFocused ? 16 : 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: _isFocused 
                  ? Theme.of(context).colorScheme.primary 
                  : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            keyboardType: widget.keyboardType,
            autofillHints: widget.autofillHints,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.6)),
              prefixIcon: Icon(widget.icon, color: _isFocused ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurfaceVariant),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 4),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
