import 'package:flutter/material.dart';
import 'package:melo_ui/src/forms/meloui_login_form.dart';

class MeloUISignPage extends StatefulWidget {
  const MeloUISignPage(
      {super.key,
      required this.title,
      required this.subTitle,
      this.isPermittedCreateAccount = true,
      this.picture});

  final Widget? picture;
  final bool isPermittedCreateAccount;
  final String title;
  final String subTitle;
  @override
  State<MeloUISignPage> createState() => _MeloUISignPageState();
}

class _MeloUISignPageState extends State<MeloUISignPage> {
  bool _isBusy = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Map<String, List<dynamic>> _errors = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 1200) {
            return Container(
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: MeloUILoginForm(
                      isBusy: _isBusy,
                      errors: _errors,
                      title: widget.title,
                      subTitle: widget.subTitle,
                      passwordController: _passwordController,
                      emailController: _emailController,
                      isPermittedCreateAccount: widget.isPermittedCreateAccount,
                      onSubmit: () {},
                      onRefresh: () {
                        setState(() {});
                      },
                    )));
          }

          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.picture == null
                    ? const Spacer()
                    : Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(left: 32),
                            alignment: Alignment.bottomLeft,
                            height: size.height * 0.6,
                            child: widget.picture),
                      ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.05),
                  child: Container(
                      width: size.width * 0.3,
                      margin: const EdgeInsets.symmetric(vertical: 64),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(32)),
                      child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: MeloUILoginForm(
                            isBusy: _isBusy,
                            errors: _errors,
                            title: widget.title,
                            subTitle: widget.subTitle,
                            passwordController: _passwordController,
                            emailController: _emailController,
                            isPermittedCreateAccount:
                                widget.isPermittedCreateAccount,
                            onSubmit: () {},
                            onRefresh: () {
                              setState(() {});
                            },
                          ))),
                ),
                widget.picture == null ? const Spacer() : Container()
              ]);
        })),
      ),
    );
  }
}
