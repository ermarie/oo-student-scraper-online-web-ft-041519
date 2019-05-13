require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_arr = []
    doc = Nokogiri::HTML(File.read(index_url))
    doc.css("div.student-card").each do |student|
      new_student = {
        :profile_url => student.css("a").attribute('href').value,
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text
      }
      student_arr << new_student
      new_student
    end
    student_arr
  end

  def self.scrape_profile_page(profile_url)
    student = {}
    doc = Nokogiri::HTML(File.read(profile_url))
    links = doc.css("div.social-icon-container")
    links.css("a").each do |link|
      binding.pry
      if link.include?("twitter")
        student[:twitter] = link.attribute('href').value
      elsif link.include?("github")
        student[:github] = link.attribute('href').value
      elsif link.include? ("linkedin")
        student[:linkedin] = link.attribute('href').value
      else
        student[:blog] = link.attribute('href').value
      end
    end
    student
  end

end
