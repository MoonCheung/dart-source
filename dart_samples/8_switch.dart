void main() {
  //典型的开关语句
  var piece = 'knight';
  switch (piece) {
    case 'bishop':
      print('diagonal');
      break;
    case 'knight':
      print('L-shape');
      break;
    default:
      print('checkmate');
  }

  // 只有空的情况下才能通过:
  piece = 'queen';
  switch (piece) {
    case 'queen':
    case 'bishop':
      print('diagonal');
      break;
  }
}
