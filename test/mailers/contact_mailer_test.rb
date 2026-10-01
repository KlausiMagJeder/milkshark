require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "inquiry builds a mail addressed to the configured recipient" do
    Rails.application.credentials.stub :dig, "kontakt@example.com" do
      contact_inquiry = build(:contact_inquiry, name: "Jamie Beispiel", email: "jamie@example.com", message: "Testnachricht")
      mail = ContactMailer.inquiry(contact_inquiry)

      assert_equal [ "kontakt@example.com" ], mail.to
      assert_equal [ "jamie@example.com" ], mail.reply_to
      assert_equal "Neue Kontaktanfrage von Jamie Beispiel", mail.subject
      assert_match "Testnachricht", mail.text_part.body.to_s
      assert_match "Testnachricht", mail.html_part.body.to_s
    end
  end

  test "inquiry raises when no recipient credential is configured" do
    Rails.application.credentials.stub :dig, nil do
      contact_inquiry = build(:contact_inquiry)

      assert_raises(ContactMailer::RecipientNotConfigured) do
        ContactMailer.inquiry(contact_inquiry).deliver_now
      end
    end
  end
end
