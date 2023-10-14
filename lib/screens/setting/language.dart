import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';
import '../../styles/color.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(color:blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap: () {
            provider.ChangeLanguage("en");
          },
              child: provider.appLanguage=="en"?
              getSelected(AppLocalizations.of(context)!.english):getUnSelected(AppLocalizations.of(context)!.english)
          ),
          InkWell(
              onTap: () {
                provider.ChangeLanguage("ar");
              },
              child: provider.appLanguage=="ar"?
              getSelected(AppLocalizations.of(context)!.arabic):getUnSelected(AppLocalizations.of(context)!.arabic)

          )
        ],
      ),
    );
  }

  Widget getSelected(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: primaryColor)),
          Icon(Icons.check, color: primaryColor, size: 20,)
        ],
      ),
    );
  }

  Widget getUnSelected(String text) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme
              .of(context)
              .textTheme
              .bodyMedium),

        ],
      ),

    );
  }


}

