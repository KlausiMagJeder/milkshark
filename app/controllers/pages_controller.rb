class PagesController < ApplicationController
  def home
    @contact_inquiry = ContactInquiry.new
  end

  def impressum
  end

  def datenschutz
  end
end
