require "test_helper"

class StylesheetTest < ActiveSupport::TestCase
  setup do
    @css = File.read(Rails.root.join("app/assets/stylesheets/application.css"))
  end

  test "defines the Milkshark color tokens" do
    assert_includes @css, "--color-bg: #faf9f7"
    assert_includes @css, "--color-text: #0f1211"
    assert_includes @css, "--color-accent: #e8622a"
  end

  test "declares DM Sans at the three required weights" do
    [ 400, 500, 700 ].each do |weight|
      assert_match(/font-weight:\s*#{weight};[^}]*src:\s*url\("dm-sans-#{weight}\.woff2"\)/m, @css)
    end
  end

  test "adapts the layout for mobile viewports" do
    assert_match(/@media \(max-width: 720px\)/, @css)
  end

  test "ships the referenced DM Sans font files" do
    [ 400, 500, 700 ].each do |weight|
      font_path = Rails.root.join("app/assets/fonts/dm-sans-#{weight}.woff2")
      assert File.exist?(font_path), "expected #{font_path} to exist"
      assert_operator File.size(font_path), :>, 1_000, "expected #{font_path} to be a real font file"
    end
  end
end
