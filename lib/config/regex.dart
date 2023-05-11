enum Regex { email, cnpj, password, cep, date, onlyNumber }

extension RegexExtension on Regex {
  RegExp getExpression() {
    switch (this) {
      case Regex.email:
        return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
      case Regex.cnpj:
        return RegExp(
            r"^(?!(\d)\1\.\1{3}\.\1{3}/\1{4}-\1{2}$)\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$");
      case Regex.password:
        return RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)|(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{6,15}$");
      case Regex.cep:
        return RegExp(r"^(\d{2})\.?(\d{3})-?(\d{3})");
      case Regex.date:
        return RegExp(r"^\d{2}/\d{2}/\d{4}");
      case Regex.onlyNumber:
        return RegExp(r"^[0-9]*$");
      default:
        return RegExp('');
    }
  }
}
