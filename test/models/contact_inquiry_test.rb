require "test_helper"

class ContactInquiryTest < ActiveSupport::TestCase
  test "valid with name, email and message" do
    contact_inquiry = build(:contact_inquiry)
    assert_predicate contact_inquiry, :valid?
  end

  test "invalid without a name" do
    contact_inquiry = build(:contact_inquiry, name: "")
    assert_not contact_inquiry.valid?
    assert_includes contact_inquiry.errors[:name], "muss ausgefüllt werden"
  end

  test "invalid with a malformed email" do
    contact_inquiry = build(:contact_inquiry, email: "not-an-email")
    assert_not contact_inquiry.valid?
    assert_includes contact_inquiry.errors[:email], "ist nicht gültig"
  end

  test "invalid without a message" do
    contact_inquiry = build(:contact_inquiry, message: "")
    assert_not contact_inquiry.valid?
    assert_includes contact_inquiry.errors[:message], "muss ausgefüllt werden"
  end

  test "is never persisted" do
    assert_not build(:contact_inquiry).persisted?
  end
end
