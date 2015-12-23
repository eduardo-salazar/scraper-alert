require 'nokogiri'
require 'open-uri'
require 'json'

# Module defines LonelyPlanetTours class which handles scraping of lonelyplanet Taiwan tours page
module SimpleScraper
  class Scraper
    
    def initialize(target)
      @target = target
      parse_html
    end

    def assert_contains_string(string)
      result = @document.xpath("//*[contains(text(),'#{string}')]")
      !result.empty?
    end

    private

    def parse_html
      puts "Trying to access #{@target}"
      # Fetch and parse HTML document
      @document = Nokogiri::HTML(open(@target))
    end

  end
end

