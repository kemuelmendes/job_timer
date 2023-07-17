import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});

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
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Erro ao salvar projeto');
            break;
          default:
            break;
        }
      },
      child: Scaffold(
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
              BlocSelector<ProjectRegisterController, ProjectRegisterStatus,
                  bool>(
                bloc: widget.controller,
                selector: (state) => state == ProjectRegisterStatus.loading,
                builder: (context, showLoading) {
                  return Visibility(
                    visible: showLoading,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 49,
                child: ElevatedButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final name = _nameEc.text;
                      final estimate = int.parse(_estimateEc.text);

                      await widget.controller.register(name, estimate);
                    }
                  },
                  child: const Text('Salvar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
