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
      Note(id: '03', noteText: 'Check Email', noteDescription: ''),
      Note(id: '04', noteText: 'Team Meating', noteDescription: ''),
      Note(
          id: '05',
          noteText: 'Work On Note App For 2 Hours',
          noteDescription: 'Svcjhc'),
    ];
  }
}
