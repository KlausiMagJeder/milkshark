class SendContactInquiry
  def self.call(contact_inquiry)
    new(contact_inquiry).call
  end

  def initialize(contact_inquiry)
    @contact_inquiry = contact_inquiry
  end

  def call
    return false unless @contact_inquiry.valid?

    ContactMailer.inquiry(@contact_inquiry).deliver_now
    true
  rescue ContactMailer::RecipientNotConfigured, Net::SMTPError, IOError => e
    Rails.logger.error("SendContactInquiry failed: #{e.class}: #{e.message}")
    @contact_inquiry.errors.add(:base, "Nachricht konnte nicht gesendet werden. Bitte versuche es später erneut.")
    false
  end
end
