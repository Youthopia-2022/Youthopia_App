class Team {
  final String teamName;
  final List heads;
  final List members;

  static List teams = [];
  Team(this.teamName, this.heads, this.members);
}

class Person {
  final String name;
  final String branch;
  final String year;
  final String url;

  Person(this.name, this.branch, this.year, this.url);
}
