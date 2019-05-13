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
    doc = Nokogiri::HTML(File.read(profile_url))
    profile_name = doc.css("div.profile-name").text
    student = {
      :bio => doc.css("div.description-holder.p").text
      :blog => doc.css("div.profile-quote").text
      :github
      :linkedin
      :profile_quote
      :twitter
    }
  end

end
