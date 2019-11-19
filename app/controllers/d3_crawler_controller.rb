require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
class D3CrawlerController < ApplicationController
  def index
  end

  def result
    # @result = {messages: params}
    @result = crawler(params[:crawler][:url])
    print @result
    render json: @result, status: :ok
  end

  private

  def crawler(url)
    @home_link = url
    to_read_links = [@home_link]
    found_links = []
    result_map = []
    
    show_links(to_read_links, found_links, result_map)
  end


  def show_links(to_read_links, found_links, result_map)
    while to_read_links.any?
      @current_url = to_read_links[0]
      @to_read_links.delete(@current_url)
      statics_link = find_assets(@current_url)
      
      add_links_to_read_list(@current_url, to_read_links, found_links)
      
      found_links << @current_url
      
      result_map << {@current_url => statics_link}
      byebug
    end
end

def add_links_to_read_list(raw_url, to_read_links, found_links)
    begin
        url = parse_url(raw_url)
        if url == false
            return
        end

        doc = Nokogiri::HTML(open(url))
        current_url_links = doc.css('a[href]').map{|a| a['href']}

        current_url_links.each do |link|
                        
            link = parse_url(link)
            
            if link && pre_conditions(link, to_read_links, found_links)
                to_read_links << link
            end
        end
    
    rescue => exception
        return
    end
end

def find_assets(current_url)
  # byebug
    begin
        doc = Nokogiri::HTML(open(@current_url))
        link = doc.css('a[href]').map{|a| a['href']}
        return doc.css('link[href], script[src], img[src]').map{|elm| elm['href'] || elm['src']}
    rescue => exception
        return
    end
end

def pre_conditions(link, to_read_links, found_links)
    if to_read_links.include? link 
        return false
    end
    if found_links.include? link
        return false
    end
    return true
end

def parse_url(current_url)
    uri = URI(current_url)

    if uri.host == "boasemente.com.br"
        return uri.to_s
    end

    if uri.host.nil? && (not uri.path.nil?)
        return URI.join("https://boasemente.com.br/", uri.path).to_s
    end

    return false
end
  
end
