import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({super.key});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _estimateEc = TextEditingController();

  @override
  void dispose() {
    _nameEc.dispose();
    _estimateEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Criar Novo Projeto',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameEc,
              decoration: const InputDecoration(
                label: Text('Nome Do Projeto'),
              ),
              validator: Validatorless.required('Nome obrigatório'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _estimateEc,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Estimativa de Horas'),
              ),
              validator: Validatorless.multiple([
                Validatorless.required('Estimativa obrigatória'),
                Validatorless.number('Permitido somente números')
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 49,
              child: ElevatedButton(
                onPressed: () {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {}
                },
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
