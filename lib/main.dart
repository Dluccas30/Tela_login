import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var _ocultarSenha = true;
void main() {
  runApp(const TelaLogin());
}

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _chaveForm = GlobalKey<FormState>();
  var _modoLogin = true;
  var _emailInserido = '';
  var _senhaInserida = '';
  var _nomeUsuarioInserido = '';

  void _enviar() async {
    if (!_chaveForm.currentState!.validate()) {
      return;
    }

    _chaveForm.currentState!.save();

    try {
      if (_modoLogin) {
        //logar usuario
        print('Usuário Logado. Email: $_emailInserido, Senha: $_senhaInserida');
      } else {
        //criar usuario
        print(
            'Usuário Criado. Email: $_emailInserido, Senha: $_senhaInserida, Nome de Usuário: $_nomeUsuarioInserido');
      }
    } catch (_) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha na autenticação.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              padding: const EdgeInsets.all(9),
              margin: const EdgeInsets.only(top: 25),
              height: 90,
              alignment: Alignment.centerLeft,
              child: Image.asset(
                '../assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            title: const Text(''),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            toolbarHeight: 145,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                color: Colors.green,
                height: 4.0,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 81, 117, 63),
          body: Container(
            padding: const EdgeInsets.only(bottom: 55),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                        left: 20,
                        right: 20,
                      ),
                      width: 200,
                      child: const Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 130,
                            color: Color.fromARGB(255, 81, 117, 63),
                          ),
                          // ignore: unnecessary_const
                          const SizedBox(height: 0),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: 300,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            key: _chaveForm,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Insira o E-mail',
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 81, 117, 63),
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  textCapitalization: TextCapitalization.none,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains('@')) {
                                      return 'Por favor, insira um endereço de email válido.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _emailInserido = value!;
                                  },
                                ),
                                const SizedBox(height: 12),
                                if (!_modoLogin)
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Nome de Usuário',
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 81, 117, 63),
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    enableSuggestions: false,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.trim().length < 4) {
                                        return 'Por favor, insira pelo menos 4 caracteres.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _nomeUsuarioInserido = value!;
                                    },
                                  ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    filled: true,
                                    fillColor:
                                        const Color.fromARGB(255, 81, 117, 63),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _ocultarSenha = !_ocultarSenha;
                                        });
                                      },
                                      child: Icon(
                                        _ocultarSenha
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                  obscureText: _ocultarSenha,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'A senha deve ter pelo menos 6 caracteres.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _senhaInserida = value!;
                                  },
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: _enviar,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 81, 117, 63),
                                  ),
                                  child: Text(
                                    _modoLogin ? 'Entrar' : 'Cadastrar',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 1.7,
                      color: const Color.fromARGB(255, 81, 117, 63),
                      margin: const EdgeInsets.only(bottom: 10),
                    ),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _modoLogin = !_modoLogin;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _modoLogin ? 'Registrar-se' : 'Já tenho uma conta',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(2, 2),
                            child: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.green,
                height: 4.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: BottomAppBar(
                  height: 143.0,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
