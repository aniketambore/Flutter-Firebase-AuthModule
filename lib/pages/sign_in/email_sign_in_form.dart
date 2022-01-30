import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_example/common_widgets/custom_alert_dialog.dart';
import 'package:flutter_auth_example/pages/sign_in/email_sign_in_model.dart';
import 'package:flutter_auth_example/services/auth.dart';
import 'package:provider/provider.dart';

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({Key? key, required this.model}) : super(key: key);
  final EmailSignInModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<EmailSignInModel>(
      create: (context) => EmailSignInModel(auth: auth),
      child: Consumer<EmailSignInModel>(
        builder: (context, model, _) => EmailSignInForm(
          model: model,
        ),
      ),
    );
  }

  @override
  State<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  EmailSignInModel get model => widget.model;

  Future<void> _submit() async {
    try {
      await model.submit();
    } on FirebaseException catch (e) {
      CustomAlertDialog(
        title: "Sign in failed",
        content: e.message!,
        defaultActionText: "OK",
      ).show(context);
    }
  }

  void _toogleFormType() {
    model.toggleFormType();
    _emailController!.clear();
    _passwordController!.clear();
  }

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  List<Widget> _buildChildren() {
    return [
      _buildHeader(),
      const SizedBox(
        height: 20.0,
      ),
      _buildEmailTextField(),
      const SizedBox(
        height: 15.0,
      ),
      _buildPasswordTextField(),
      const SizedBox(
        height: 15.0,
      ),
      _buildFormActions(),
    ];
  }

  Widget _buildHeader() {
    return Text(
      model.headerText,
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "test@test.com",
          border: OutlineInputBorder(),
          icon: Icon(Icons.mail),
          errorText: model.emailErrorText,
          enabled: model.isLoading == false),
      focusNode: _emailFocusNode,
      onEditingComplete: () => _emailEditingComplete(),
      onChanged: model.updateEmail,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock),
          errorText: model.passwordErrorText,
          enabled: model.isLoading == false),
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocusNode,
      onEditingComplete: _submit,
      onChanged: model.updatePassword,
    );
  }

  Widget _buildFormActions() {
    if (model.isLoading) {
      return const CircularProgressIndicator();
    }
    return Column(
      children: [
        ElevatedButton(
          onPressed: model.canSubmit ? _submit : null,
          child: Text(
            model.primaryButtonText,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange[200],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        ),
        TextButton(
            onPressed: !model.isLoading ? _toogleFormType : null,
            child: Text(
              model.secondaryButtonText,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: _buildChildren(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
