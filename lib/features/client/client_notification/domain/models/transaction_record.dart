import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

enum TransactionStatus { completed, pending, failed }

class TransactionRecord extends Equatable {
  const TransactionRecord({
    required this.id,
    required this.vendorName,
    required this.category,
    required this.amount,
    required this.status,
    required this.dateLabel,
    required this.reference,
    required this.paymentSource,
    required this.vendorEmail,
    required this.vendorPhone,
    required this.vendorAddress,
    required this.eventType,
    required this.eventDate,
    required this.description,
    required this.subtotal,
    required this.serviceFee,
    required this.tax,
    this.isCredit = false,
    this.statusNote = '',
    this.paymentBadge = '',
  });

  final String id;
  final String vendorName;
  final String category;
  final double amount;
  final TransactionStatus status;
  final String dateLabel;
  final String reference;
  final String paymentSource;
  final String vendorEmail;
  final String vendorPhone;
  final String vendorAddress;
  final String eventType;
  final String eventDate;
  final String description;
  final double subtotal;
  final double serviceFee;
  final double tax;
  final bool isCredit;
  final String statusNote;
  final String paymentBadge;

  String get amountLabel {
    final formatter = NumberFormat.currency(symbol: '₦', decimalDigits: 0);
    final prefix = isCredit ? '+' : '-';
    return '$prefix${formatter.format(amount.abs())}';
  }

  String get plainAmountLabel {
    final formatter = NumberFormat.currency(symbol: '₦', decimalDigits: 0);
    return formatter.format(amount.abs());
  }

  double get totalAmount => subtotal + serviceFee + tax;

  @override
  List<Object?> get props => [
    id,
    vendorName,
    category,
    amount,
    status,
    dateLabel,
    reference,
    paymentSource,
    vendorEmail,
    vendorPhone,
    vendorAddress,
    eventType,
    eventDate,
    description,
    subtotal,
    serviceFee,
    tax,
    isCredit,
    statusNote,
    paymentBadge,
  ];
}
