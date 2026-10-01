# Changelog

Alle nennenswerten Änderungen werden in dieser Datei dokumentiert.

Format: [Keep a Changelog](https://keepachangelog.com/de/1.1.0/),
Versionierung: [SemVer](https://semver.org/lang/de/).

## [Unreleased]

### Added

- Mobile Darstellung: Breakpoint bis 720px mit schmaleren Rändern, kompakteren Abständen und gestapelter Leistungsliste; Grids und Footer-Links laufen auf schmalen Bildschirmen nicht mehr über

### Fixed

- Wortmarke im Header wurde abgeschnitten: Das SVG-`<img>` konnte die Webfont nicht nutzen und fiel auf eine breitere Systemschrift zurück. Header und Hero nutzen jetzt ein gemeinsames Text-Partial `pages/_wordmark` in DM Sans

## [0.1.0] - 2026-10-01

### Added

- Rails-8.1-Grundgerüst mit Propshaft, Importmap, Turbo und Stimulus sowie Solid Cache, Solid Queue und Solid Cable auf SQLite
- Milkshark-Design: DM-Sans-Fonts (400/500/700) selbst gehostet, Logo und Wordmark als SVG, CSS-Foundation in `application.css`
- Seiten: Startseite, Impressum und Datenschutzerklärung mit eigenem Header und Footer für die Rechtsseiten
- Kontaktformular auf der Startseite:
  - `ContactInquiry` als Form-Object (Name, E-Mail, Nachricht) mit Längenbegrenzung
  - `SendContactInquiry`-Service mit Fehlerbehandlung bei SMTP-Problemen und fehlendem Empfänger
  - `ContactMailer` mit HTML- und Text-Variante, Empfänger aus den Credentials (`contact.recipient_email`)
- Deutsche Locale für Validierungsfehler
- Release-Infrastruktur: `VERSION`-Datei, `CHANGELOG.md` sowie die Workflows `release.yml` und `pre-release-check.yml`
- CI-Workflow mit Brakeman, Bundler-Audit, Importmap-Audit, RuboCop und Tests; Dependabot für Gems und GitHub Actions
- Kamal-Deploy-Konfiguration und Dockerfile
- Minitest-Suite mit FactoryBot für Model, Service, Mailer, Controller und Stylesheet

### Security

- Honeypot-Feld im Kontaktformular gegen Spam-Bots
- Rate-Limiting auf dem Kontakt-Endpoint (5 Anfragen pro Stunde)

[Unreleased]: https://github.com/KlausiMagJeder/milkshark/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/KlausiMagJeder/milkshark/releases/tag/v0.1.0
