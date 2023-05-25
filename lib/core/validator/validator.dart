class Validator {
  static String? generalField(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else
      return null;
  }

  static String? email(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (!value.contains('@') || !value.contains('.'))
      return 'EX: example@mail.com';
    else
      return null;
  }

  static String? phoneNumber(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (!value.startsWith('01'))
      return 'Mobile number must start with 01';
    else if (value.length != 11)
      return 'Mobile number must consist of 11 digits';
    else
      return null;
  }

  static String? pinCode(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length != 4)
      return 'Pin Code must consist of 4 digits';
    else
      return null;
  }

  static String? password(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 6)
      return 'Password must not be less than 6 characters';
    else
      return null;
  }

  static String? confirmPassword(String value, String password) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 6)
      return 'Password must not be less than 6 characters';
    else if (password != value)
      return 'Password does not match';
    else
      return null;
  }

  static String? name(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 4)
      return 'Name must be at least 4 characters long';
    else
      return null;
  }

  static String? notes(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else
      return null;
  }

  static String? enquiry(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 10 || value.length > 3000)
      return "Your message must be longer than 10 characters and less than 3000 characters";
    else
      return null;
  }

  static String? search(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else
      return null;
  }

  static String? address(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 10 || value.length > 50)
      return 'Title must be greater than 10 characters and less than 50 characters';
    else
      return null;
  }

  static String? day(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return 'Wrong content';
    else if (int.parse(value) < 1 || int.parse(value) > 31)
      return '1 - 31';
    else if (value.length > 2)
      return 'Wrong content';
    else
      return null;
  }

  static String? month(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return 'Wrong content';
    else if (int.parse(value) < 1 || int.parse(value) > 12)
      return '1 - 12';
    else if (value.length > 2)
      return 'Wrong content';
    else
      return null;
  }

  static String? year(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return 'Wrong content';
    else if (int.parse(value) < 1950 || int.parse(value) > 2020)
      return '1950 - 2020';
    else if (value.length > 4)
      return 'Wrong content';
    else
      return null;
  }

  static String? comment(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 25)
      return 'Comment must be greater than 25 characters';
    else
      return null;
  }

  static String? report(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 5)
      return 'Report must be longer than 5 characters';
    else
      return null;
  }

  static String? productTitle(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 4)
      return 'Title must be greater than 4 characters';
    else
      return null;
  }

  static String? productDetails(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else if (value.length < 10)
      return 'Details must be longer than 10 characters';
    else
      return null;
  }

  static String? productPrice(String value) {
    if (value.isEmpty)
      return 'Empty field!';
    else
      return null;
  }
}
