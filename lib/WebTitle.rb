require 'open-uri'
require 'nokogiri'

class WebTitle
  def self.parse(url)
    begin
      uri = URI.parse(url)
      raise URI::InvalidURIError unless uri.scheme && uri.host

      html = URI.open(url)
      doc = Nokogiri::HTML(html)
      
      title = doc.at('title')
      
      if title
        glowing_title = "\e[1m\e[33m#{title.text}\e[0m"  
        puts "Title: #{glowing_title}"
      else
        puts "No title tag found on the webpage."
      end
    rescue URI::InvalidURIError
      puts "Invalid URL. Please enter a valid URL."
    rescue OpenURI::HTTPError => e
      puts "Error fetching the webpage: #{e.message}"
    rescue StandardError => e
      puts "An unexpected error occurred: #{e.message}"
    end
  end
end

