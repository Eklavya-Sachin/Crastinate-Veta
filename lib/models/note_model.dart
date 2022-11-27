class Note {
  String? id;
  String? noteText;
  String? noteDescription;

  Note({required this.id, required this.noteText, this.noteDescription});

  static List<Note> noteList() {
    return [
      Note(
          id: '01',
          noteText: 'Morning Exercise',
          noteDescription:
              'Sachin is a health guy who workout erverydayvchchbcbckbczbh,cvzbh,vjb,vcjcvhcvxhjkbcvxhjbcvxhbcxvhbcvhbvbk,nmzzh'),
      Note(id: '02', noteText: 'Buy Groceries', noteDescription: ''),
    ];
  }
}
