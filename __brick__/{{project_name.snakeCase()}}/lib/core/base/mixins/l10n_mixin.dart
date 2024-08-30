import '../../l10n/translation.dart';
import '../inject.dart';

mixin L10nMixin {
  StringsTranslations get l10n => Inject.find();
}
