require "test_helper"

class SendContactInquiryTest < ActiveSupport::TestCase
  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "delivers the inquiry mail for a valid contact inquiry" do
    Rails.application.credentials.stub :dig, "kontakt@example.com" do
      contact_inquiry = build(:contact_inquiry)

      assert SendContactInquiry.call(contact_inquiry)
      assert_equal 1, ActionMailer::Base.deliveries.size
    end
  end

  test "does not deliver mail for an invalid contact inquiry" do
    contact_inquiry = build(:contact_inquiry, email: "")

    assert_not SendContactInquiry.call(contact_inquiry)
    assert_empty ActionMailer::Base.deliveries
  end

  test "returns false and adds a base error when the mailer raises" do
    Rails.application.credentials.stub :dig, nil do
      contact_inquiry = build(:contact_inquiry)

      assert_not SendContactInquiry.call(contact_inquiry)
      assert_includes contact_inquiry.errors[:base], "Nachricht konnte nicht gesendet werden. Bitte versuche es später erneut."
    end
  end
end
