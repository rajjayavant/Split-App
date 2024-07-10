class Transaction {
  static const Set<String> _allowedTransactionTypes = {
    'Equally',
    'Unequally',
    'ByPercent',
    'ByShares',
    'BysAdjustment',
    'OneWayPay'
  };

  String name;
  final int transactionId;
  double amount;
  Map<String,  double>? payers; // List of user IDs
  Map<String,  double>? receivers; // List of user IDs
  String transactionType = 'Equally';
  double shareRatio;
  DateTime createdAt;

  Transaction({
    required this.transactionId,
    required this.name,
    required this.amount,
    this.payers,
    this.receivers,
    String? transactionType,
    required this.shareRatio,
    DateTime? createdAt,
  })  : createdAt = createdAt ?? DateTime.now() {
    if (!_allowedTransactionTypes.contains(transactionType)) {
      throw ArgumentError('Invalid transaction type');
    } else {
      this.transactionType = transactionType ?? "Equally";
    }
  }

  Transaction.equally({
    required this.transactionId,
    required this.name,
    required this.amount,
    this.payers,
    this.receivers,
    String? transactionType,
    required this.shareRatio,
    DateTime? createdAt,
  })  : createdAt = createdAt ?? DateTime.now() {
    if (transactionType != 'Equally') {
      throw ArgumentError('Wrong Constructor');
    } else {
      this.transactionType = transactionType ?? "Equally";
    }
  }

}

