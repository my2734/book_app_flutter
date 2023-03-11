class Comment {
  String id;
  String idBook;
  String emailUser;
  String content;

  Comment(
    this.id,
    this.idBook,
    this.emailUser,
    this.content,
  );

  static List<Comment> generateComments(){
    return [
        
       Comment(
        '1',
        '35',
        'ngocmy@gmail.com',
        'Truyện hông hay'
      ),
       Comment(
        '2',
        '35',
        'ngocmy@gmail.com',
        'Truyện hay that'
      ),
      Comment(
        '3',
        '35',
        'ngocmy@gmail.com',
        'Theo ca nhan truyện hơi hay'
      ),
      Comment(
        '4',
        '35',
        'ngocmy@gmail.com',
        'Truyện hay'
      ),
       Comment(
        '5',
        '35',
        'ngocmy@gmail.com',
        'Truyện hông hay'
      ),
       Comment(
        '6',
        '35',
        'ngocmy@gmail.com',
        'Truyện hay that'
      ),
      Comment(
        '7',
        '35',
        'ngocmy@gmail.com',
        'Theo ca nhan truyện hơi hay'
      ),
    ];
  }
}
