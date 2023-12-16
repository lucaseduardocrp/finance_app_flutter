class Validator {
  Validator._();

  static String? validatedName(String? value){
    final condition = RegExp(r"^[a-zA-ZÀ-ÿ\'\s]+$");
    
    if(value != null && value.isEmpty){
      return 'The names field is required';
    }

    if(value != null && condition.hasMatch(value)){
      return 'This name is invalid. Please enter another name!';
    }
    
    return null;               
  }

  static String? validatedEmail(String? value){
    final condition = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if(value != null && value.isEmpty){
      return 'The email field is required';
    }

    if(value != null && condition.hasMatch(value)){
      return 'This Email is invalid. Please enter another email!';
    }
    return null;               
  }

  static String? validatedPassword(String? value){
    final condition = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[a-zA-Z\d\W_]{8,}$");

    if(value != null && value.isEmpty){
      return 'The password field is required';
    }
 
    if(value != null && condition.hasMatch(value)){
      return 'This password is invalid. Is necessary 8 characters and includes a uppercase letter, lowercase letter and a especial char!';
    }

    return null;               
  }

  static String? validatedConfirmPassword(String? value){
    if(value != null && value.isEmpty){
      return 'The password confirm field is required';
    }
    return null;               
  }
}