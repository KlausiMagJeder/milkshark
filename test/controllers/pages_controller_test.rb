require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "GET impressum renders the legal notice" do
    get impressum_path
    assert_response :success
    assert_select "h1", "Impressum"
    assert_select "body", text: /Martin Beyer/
  end

  test "GET datenschutz renders the privacy notice" do
    get datenschutz_path
    assert_response :success
    assert_select "h1", "Datenschutz"
    assert_select "body", text: /lokal ausgeliefert/
  end

  test "GET / renders the hero, services and approach sections" do
    get root_path
    assert_response :success
    assert_select "h1", text: /shark/
    assert_select "h2", text: "Leistungen"
    assert_select "h3", text: "Softwareentwicklung"
    assert_select "h2", text: "Ansatz"
    assert_select "h2", text: "Kontakt"
  end

  test "headers render the wordmark as web-font text instead of an svg image" do
    [ root_path, impressum_path, datenschutz_path ].each do |path|
      get path
      assert_select ".site-header .site-header__brand .wordmark", text: /shark/
      assert_select ".site-header img", false, "expected no wordmark image in the header of #{path}"
    end
  end
end
