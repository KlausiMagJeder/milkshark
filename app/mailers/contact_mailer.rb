class ContactMailer < ApplicationMailer
  class RecipientNotConfigured < StandardError; end

  def inquiry(contact_inquiry)
    recipient = Rails.application.credentials.dig(:contact, :recipient_email)
    raise RecipientNotConfigured, "Set credentials contact.recipient_email before sending contact inquiries" if recipient.blank?

    @contact_inquiry = contact_inquiry

    mail(
      to: recipient,
      reply_to: contact_inquiry.email,
      subject: "Neue Kontaktanfrage von #{contact_inquiry.name}"
    )
  end
end
