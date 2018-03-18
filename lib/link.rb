require_relative 'databaseconnection'
require 'uri'

class Link
  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    #p result
    result.map { |link| link['url'] }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{options[:url]}')")
    true
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
