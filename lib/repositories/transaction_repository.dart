import 'package:finance_app/common/models/transaction_model.dart';

abstract class TransacationRepository {
  Future<void> addTransaction();
  Future<List<TransactionModel>> getAllTransaction();
}

class TransactionRepositoryImpl implements TransacationRepository {
  @override
  Future<void> addTransaction() {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      TransactionModel(
        title: 'Salary',
        value: 23000.00,
        date: DateTime.now().millisecondsSinceEpoch
      ),
      TransactionModel(
        title: 'Facebook Ad', 
        value: -33.00, 
        date: DateTime.now().subtract(const Duration(days: 7)).millisecondsSinceEpoch
      )
    ];
  }

}