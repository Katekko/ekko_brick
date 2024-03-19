extension StringUtils on String {
  String get removeAccents {
    var text = '';
    const withAccents = 'ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç';
    const withoutAccents = 'AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc';

    for (int i = 0; i < withAccents.length; i++) {
      text = replaceAll(
        withAccents[i].toString(),
        withoutAccents[i].toString(),
      );
    }

    return text;
  }

  String get toAnalyticsFormat {
    var text = '';
    text = replaceAll(' ', '-');
    text = text.replaceAll(',', '');
    text = removeAccents;
    text = text.toLowerCase();

    return text;
  }
}
