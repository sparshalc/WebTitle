require "minitest/autorun"
require "WebTitle"

class WebScraperTest < Minitest::Test
  def test_valid_url_with_title
    output = capture_io do
      WebTitle.parse('https://sparshalamichhane.com.np')
    end

    assert_match(/Sparsha Lamichhane - Official Site/, output.join)
  end
  def test_invalid_url_format
    output = capture_io do
      WebTitle.parse('sparshalamichhane.com.np')
    end

    assert_match(/Invalid URL. Please enter a valid URL./, output.join)
  end
end
