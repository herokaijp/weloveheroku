require 'resolv'
class Site < ActiveRecord::Base
  validates_presence_of :name, :url, :creator
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :url, :minimum => 3, :maximum => 100
  validates_length_of :description, :minimum => 0, :maxmum => 1000
  validates_length_of :creator, :minimum =>1, :maximum => 100
  validates_length_of :hash_tag, :minimum =>0, :maximum => 140
  validates_length_of :repository_url, :minimum => 3, :maximum => 100
  validates_uniqueness_of :url, :repository_url
  validate :url_is_heroku?

  private
  def url_is_heroku?
    return if self.url =~ /heroku(app)?\.com\/?/
    return true if Rails.env.test?
    if self.url =~ /http(?:s)?:\/\/([^\/]+)/
      host = $1
      begin
        ipaddress = Resolv.getaddress host
      rescue => e
        logger.error e.message
        errors.add :url, ' Invalid heroku URL'
        return
      end
      unless APP_CONFIG[:heroku][:custom_domain].include? ipaddress
        begin
          cname = Resolv::DNS.new.getresource(host, Resolv::DNS::Resource::IN::ANY).name.to_s
        rescue => e
          logger.error e.message
          errors.add :url, ' Invalid heroku URL'
          return
        end
        unless cname =~ /heroku(app|ssl)?\.com\/?/
          errors.add :url, ' Invalid heroku URL'
        end
      end
    end
  end

end
