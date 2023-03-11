class Category{
  String? id;
  String? name;
  String? image;

  Category(this.id, this.name, this.image);

   static List<Category> generateCategory() {
    return [
      Category(
        '1',
        'Chính trị',
        'chinhtri.jpg'
      ),
      
      // Category(
      //   '2',
      //   'Khoa học công nghệ',
      //   'khoahoccongnghe'
      // ),
      Category(
        '3',
        'Kinh tế',
        'kinhte.jpg'
      ),
      Category(
        '4',
        'Văn học',
        'vanhoc.jpg'
      ),
      Category(
        '5',
        'Nghệ thuật',
        'nghethuat.jpg'
      ),
      Category(
        '6',
        'Văn hóa xã hội',
        'vanhoaxahoi.jpg'
      ),
      Category(
        '7',
        'Lịch sử',
        'lichsu.jpg'
      ),
      Category(
        '8',
        'Truyện',
        'truyen.jpg'
      ),
       Category(
        '9',
        'Tâm lý',
        'tamly.jpg'
      ),
       Category(
        '10',
        'Tôn giáo',
        'tongiao.jpg'
      ),
       Category(
        '11',
        'Thiếu nhi',
        'thieunhi.jpg'
      ),
      Category(
        '12',
        'Pháp luật',
        'phapluat.jpg'
      ),
    ];
   }
}