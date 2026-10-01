# milkshark

![Version](https://img.shields.io/badge/version-0.1.0-blue)

Website von Milkshark mit Startseite, Impressum, Datenschutzerklärung und Kontaktformular. Rails 8.1, Ruby siehe `.ruby-version`.

## Vor dem ersten Deploy

Das Kontaktformular benötigt vor dem produktiven Einsatz:

- `bin/rails credentials:edit` → `contact.recipient_email` auf die Ziel-E-Mail-Adresse setzen
- SMTP-Zugangsdaten in `config/environments/production.rb` (`config.action_mailer.smtp_settings`) hinterlegen
- `config.action_mailer.default_url_options[:host]` in `config/environments/production.rb` auf die echte Domain setzen
- `default from:` in `app/mailers/application_mailer.rb` auf eine Absenderadresse der eigenen Domain setzen

## Releases

Die aktuelle Version steht in `VERSION`, die Änderungen pro Version in [`CHANGELOG.md`](CHANGELOG.md). Der Versions-Badge oben muss zu `VERSION` passen, die Release-Workflows prüfen das.

1. `/release prepare` — Version in `VERSION` und README-Badge bumpen, `CHANGELOG.md` umstrukturieren, RuboCop und Tests lokal ausführen
2. Commit, PR, Merge nach `main`
3. `/release` — Tag `vX.Y.Z` setzen und pushen; `.github/workflows/release.yml` validiert und erstellt das GitHub-Release
