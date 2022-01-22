class CommentModel{
  late String comment;
  late DateTime dateTime;
  List ?emojisReaction;  // this might be integrated in the future
  // TODO : when the auth is done add the user id in this model

  CommentModel({required this.comment,required this.dateTime,this.emojisReaction});

}