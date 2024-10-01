class CalendarModel {
  String name;
  String imagePath;

  CalendarModel({required this.name, required this.imagePath});

  static List<CalendarModel> getCalendar() {
    List<CalendarModel> news = [];

    news.add(
      CalendarModel(
        name: 'ჯვარის ამაღლების შემდგომი დღესასწაული',
        imagePath: 'assets/test1.jpg',
      ),
    );

    news.add(
      CalendarModel(
        name: 'ჯვარის ამაღლების შემდგომი დღესასწაული',
        imagePath: 'assets/test2.jpg',
      ),
    );

    news.add(
      CalendarModel(
        name: 'ჯვარის ამაღლების შემდგომი დღესასწაული',
        imagePath: 'assets/test3.jpg',
      ),
    );

    news.add(
      CalendarModel(
        name: 'უფლის ცხოველსმყოფელი ჯვარის ამაღლების დღესასწაულის წარგზავნა.',
        imagePath: 'assets/test4.jpg',
      ),
    );

    return news;
  }
}
