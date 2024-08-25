import 'dart:io';

const String appName = 'MySuperApp';
bool isUserConnected = false;
String userName = "";
String password = "";

Map<String, bool> todoList = {
  "Clean the bedroom": false,
  "Clean the car": true,
  "Call the garagist": false,
};

void main(List<String> arguments) {
  showWelcomeScreen();
}

//DIFFRENTS SCREENS
void showWelcomeScreen() {
  drawLine();
  stdout.write("*WELCOME SCREEN*\n");
  stdout.write("Welcome to $appName ! \n");

  if (isUserConnected) {
    stdout.write("You are already logged in\n");
    showHomeScreen() {}
  } else {
    stdout.write("You are not logged in\n");
    showLogChoiceScreen();
  }
  drawLine();
}

void showLogChoiceScreen() {
  String userChoice = '';

  drawLine();
  stdout.write("*LOG CHOICE SCREEN*\n");

  while (userChoice.toLowerCase() != 'l' && userChoice.toLowerCase() != 'c') {
    stdout.write("Press 'l' to (l)og or 'c' to (c)reate an account : ");
    userChoice = readNextString();
  }

  if (userChoice.toLowerCase() == 'l') {
    showLoginScreen();
  } else if (userChoice.toLowerCase() == 'c') {
    showCreateAccountScreen();
  }
}

void showLoginScreen() {
  String userNameEntry = "";
  String passwordEntry = "";

  drawLine();
  stdout.write("*LOG IN SCREEN*\n");
  while (
      userName.isNotEmpty && password.isNotEmpty && passwordEntry.length >= 8) {
    stdout.write("Enter you name : ");
    userName = readNextString();
    stdout.write("\nEnter your password : ");
    password = readNextString();
  }

  userName = userNameEntry;
  password = passwordEntry;
  isUserConnected = true;
  stdout.write("\nWelcome back $userName\n");
}

void showCreateAccountScreen() {
  String userNameEntry = "";
  String passwordEntry = "";

  drawLine();
  stdout.write("*CREATE ACCOUNT SCREEN*\n");

  while (userName.isNotEmpty && password.isNotEmpty) {
    stdout.write("Enter you name : ");
    userName = readNextString();
    stdout.write("\nChoose a password : ");
    password = readNextString();
  }

  userName = userNameEntry;
  password = passwordEntry;
  isUserConnected = true;

  stdout.write("\nAccount created :\n");
  stdout.write("Name : $userNameEntry\n");
  stdout.write("Password : ${'*' * passwordEntry.length}\n");
  stdout.write("You are now logged in !\n");
}

void showHomeScreen() {
  String userChoice = '';

  drawLine();
  stdout.write("*HOME SCREEN*\n");
  stdout.write("Welcome to your board $userName !\n");

  if (todoList.isNotEmpty) {
    stdout.write("You still have tasks to do !\n");
    todoList.forEach((description, isDone) {
      if (!isDone) {
        stdout.write(" - $description\n");
      }
    });
  }

  stdout.write("Press 'c' to (c)reate a new task : ");
  userChoice = readNextString();
  if (userChoice == "c") {
    stdout.write("You can now create a new task !");
  }
}

//UTILS FUNCTION
void drawLine() {
  stdout.write('--------------------\n');
}

String readNextString() {
  String? returnValue = stdin.readLineSync();

  if (returnValue != null) {
    return returnValue;
  } else {
    return '';
  }
}
