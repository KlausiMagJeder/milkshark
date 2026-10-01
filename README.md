# milkshark

## Vor dem ersten Deploy

Das Kontaktformular benötigt vor dem produktiven Einsatz:

- `bin/rails credentials:edit` → `contact.recipient_email` auf die Ziel-E-Mail-Adresse setzen
- SMTP-Zugangsdaten in `config/environments/production.rb` (`config.action_mailer.smtp_settings`) hinterlegen
- `config.action_mailer.default_url_options[:host]` in `config/environments/production.rb` auf die echte Domain setzen
- `default from:` in `app/mailers/application_mailer.rb` auf eine Absenderadresse der eigenen Domain setzen