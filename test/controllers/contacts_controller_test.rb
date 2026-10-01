require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    ActionMailer::Base.deliveries.clear
  end

  test "valid submission sends the mail and redirects with a flash notice" do
    Rails.application.credentials.stub :dig, "kontakt@example.com" do
      post contact_path, params: { contact_inquiry: { name: "Jamie Beispiel", email: "jamie@example.com", message: "Testnachricht" } }

      assert_redirected_to root_path(anchor: "kontakt")
      assert_equal 1, ActionMailer::Base.deliveries.size
      follow_redirect!
      assert_select ".flash--notice"
    end
  end

  test "invalid submission re-renders the home page with errors and sends no mail" do
    post contact_path, params: { contact_inquiry: { name: "", email: "not-an-email", message: "" } }

    assert_response :unprocessable_content
    assert_select ".contact-form__errors"
    assert_empty ActionMailer::Base.deliveries
  end

  test "honeypot-filled submission is silently accepted without sending mail" do
    post contact_path, params: { contact_inquiry: { name: "Bot", email: "bot@example.com", message: "spam", honeypot: "filled" } }

    assert_redirected_to root_path(anchor: "kontakt")
    assert_empty ActionMailer::Base.deliveries
  end
end
