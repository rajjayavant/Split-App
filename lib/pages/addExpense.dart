import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:split_app/pages/globaluser.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Add your onPressed code here
            },
          ),
        ],
      ),
      body: AddExpenseBody(),
    );
  }
}

class AddExpenseBody extends StatefulWidget {
  @override
  _AddExpenseBodyState createState() => _AddExpenseBodyState();
}

class _AddExpenseBodyState extends State<AddExpenseBody> {
  final List<String> myFriends = globalUser.friends;
  List<String> _selectedFriends = [];
  List<String> _selectedPayers = [];
  Map <String, double> unequalPayers = {};
  String _expenseName = '';
  double _amount = 0.0;
  bool _isSplitEqually = true;
  Map<String, double> _individualAmounts = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MultiSelectDialogField(
            items: myFriends
                .map((friend) => MultiSelectItem(friend, friend))
                .toList(),
            title: const Text("Select Friends"),
            selectedColor: Theme.of(context).colorScheme.primary,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2,
              ),
            ),
            buttonIcon: const Icon(
              Icons.group,
              color: Colors.grey,
            ),
            buttonText: const Text(
              "Friends",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            onConfirm: (results) {
              setState(() {
                _selectedFriends = results.cast<String>();
                _selectedPayers.clear();
                _individualAmounts.clear();
              });
            },
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Expense Name',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _expenseName = value;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Amount',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _amount = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSplitEqually = true;
                  });
                },
                child: _isSplitEqually
                    ? const Row(children: [Icon(Icons.check), Text("Equally")])
                    : const Text("Equally"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (context) {
                      return MultiSelectDialog(
                        items: _selectedFriends
                            .map((friend) => MultiSelectItem(friend, friend))
                            .toList(),
                        initialValue: _selectedPayers,
                        title: const Text("Select Payers"),
                      );
                    },
                  );
                  if (results != null) {
                    setState(() {
                      _selectedPayers = results;
                    });
                  }
                },
                child: !_isSplitEqually
                    ? const Row(
                        children: [Icon(Icons.check), Text("Unequally")])
                    : const Text("Unequally"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (!_isSplitEqually)
            Expanded(
              child: ListView.builder(
                itemCount: _selectedFriends.length,
                itemBuilder: (context, index) {
                  String friend = _selectedFriends[index];
                  return ListTile(
                    title: Text(friend),
                    subtitle: TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _individualAmounts[friend] =
                              double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
