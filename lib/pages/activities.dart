import 'package:flutter/material.dart';
import 'package:application_laboratorio/domain/entities/activity.dart';
import 'package:application_laboratorio/data/services/database_helper.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Activity> _activities = [];

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  Future<void> _loadActivities() async {
    final activities = await _dbHelper.getActivities();
    setState(() {
      _activities = activities;
    });
  }

  Future<void> _showActivityDialog({Activity? existingActivity}) async {
    final nameController = TextEditingController(
      text: existingActivity?.name ?? '',
    );
    final dateController = TextEditingController(
      text: existingActivity?.date ?? '',
    );

    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            existingActivity == null ? 'Agregar actividad' : 'Editar actividad',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Fecha'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(existingActivity == null ? 'Agregar' : 'Guardar'),
            ),
          ],
        );
      },
    );
    if (result == true) {
      final name = nameController.text;
      final date = dateController.text;

      if (name.isNotEmpty && date.isNotEmpty) {
        if (existingActivity == null) {
          await _dbHelper.insertActivity(Activity(name: name, date: date));
        } else {
          await _dbHelper.updateActivity(
            Activity(id: existingActivity.id!, name: name, date: date),
          );
        }

        if (!mounted) return;
        _loadActivities();
      }
    }
  }

  Future<void> _deleteActivity(int id) async {
    await _dbHelper.deleteActivity(id);
    _loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actividades')),
      body: ListView.builder(
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return ListTile(
            title: Text(activity.name),
            subtitle: Text(activity.date),
            onTap: () => _showActivityDialog(existingActivity: activity),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed:
                  activity.id != null
                      ? () => _deleteActivity(activity.id!)
                      : null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showActivityDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
