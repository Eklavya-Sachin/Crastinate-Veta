class Note {
  String? id;
  String? noteText;

  Note({
    required this.id,
    required this.noteText,
  });

  static List noteList() {
    return [
      Note(id: '01', noteText: 'Morning Exercise'),
      Note(id: '02', noteText: 'Buy Groceries'),
      Note(id: '03', noteText: 'Check Email'),
      Note(id: '04', noteText: 'Team Meating'),
      Note(id: '05', noteText: 'Work On Note App For 2 Hours'),
      Note(id: '06', noteText: 'Dinner With ----'),
    ];
  }
}
