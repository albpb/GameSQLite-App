class Game {
  int id;
  //description is the text we see on
  //main screen card text
  String title;
  String platform;

  //When using curly braces { } we note dart that
  //the parameters are optional
  Game({this.id, this.title, this.platform});

  factory Game.fromDatabaseJson(Map<String, dynamic> data) => Game(
        //Factory method will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Todo object

        id: data['id'],
        title: data['title'],

        //Since sqlite doesn't have boolean type for true/false,
        //we will use 0 to denote that it is false
        //and 1 for true
        platform: data['platform'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        //A method will be used to convert Todo objects that
        //are to be stored into the datbase in a form of JSON

        "id": this.id,
        "title": this.title,
        "platform": this.platform,
      };
}
