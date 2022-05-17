///Removes the redundant part of some returned transaction comments
String stripComment(String? text) {
  if (text == null) {
    return "No Transaction Description";
  }

  if (text.startsWith("BillPayment")) {
    return text.substring(12);
  }

  if (text.startsWith("Transfer")) {
    return text.substring(10);
  }
  return text;
}
