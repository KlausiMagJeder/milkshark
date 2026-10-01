class ContactsController < ApplicationController
  rate_limit to: 5, within: 1.hour, only: :create

  def create
    if params.dig(:contact_inquiry, :honeypot).present?
      redirect_to root_path(anchor: "kontakt"), notice: "Danke für deine Nachricht, wir melden uns."
      return
    end

    @contact_inquiry = ContactInquiry.new(contact_inquiry_params)

    if SendContactInquiry.call(@contact_inquiry)
      redirect_to root_path(anchor: "kontakt"), notice: "Danke für deine Nachricht, wir melden uns."
    else
      render "pages/home", status: :unprocessable_content
    end
  end

  private

  def contact_inquiry_params
    params.expect(contact_inquiry: [ :name, :email, :message ])
  end
end
