import '../../l10n/translation.dart';
import '../inject.dart';

mixin l10nMixin {
  StringsTranslations get l10n => Inject.find();
}
