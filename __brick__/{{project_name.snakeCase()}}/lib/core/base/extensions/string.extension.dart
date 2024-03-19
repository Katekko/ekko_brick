String removeAccents(String text) {
  const withAccents = 'ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç';
  const withoutAccents = 'AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc';

  for (int i = 0; i < withAccents.length; i++) {
    text = text.replaceAll(
      withAccents[i].toString(),
      withoutAccents[i].toString(),
    );
  }

  return text;
}

extension StringUtils on String {
  String get toAnalyticsFormat {
    var text = '';
    text = replaceAll(' ', '-');
    text = text.replaceAll(',', '');
    text = removeAccents(text);
    text = text.toLowerCase();

    return text;
  }
}
