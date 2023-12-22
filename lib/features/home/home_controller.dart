import 'package:finance_app/common/models/transaction_model.dart';
import 'package:finance_app/features/home/home_state.dart';
import 'package:finance_app/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final TransacationRepository _transacationRepository;
  
  HomeController(this._transacationRepository);

  HomeState _state = HomeInitialState();

  HomeState get state => _state;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  void _changeState(HomeState newState){
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _changeState(HomeLoadingState());
    
    try {
      _transactions = await _transacationRepository.getAllTransaction();
      _changeState(HomeSuccessState());
      
    } catch (e) {
      _changeState(HomeErrorState(e.toString()));
    }
  }
}