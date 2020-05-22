require 'open-uri'

class PjvScrapingService < ApplicationService
  attr_reader :params, :judgement
  
  def initialize params
    @params = params
  end

  def call
    judgement_init
    set_judgement_info
    set_judgement_notifications
    judgement
  end

  private

  def judgement_init
    raw_data = open(params[:url])
    html = Nokogiri::HTML(raw_data)
    @body = html.css('div.block-flat')[0]
  end

  def set_judgement_info
    @file_number = get_file_number_from_header
    @judgement = Judgement.find_or_initialize_by(file_number: @file_number)

    content = @body.css('div.content')
    str_info = content[0].to_s
    data = str_info.split("<br>")
    @judgement.court = sanitize(data[0])

    data[1].slice!("Actor: ")
    @judgement.claimant = sanitize(data[1], )

    data[2].slice!("Demandado: ")
    @judgement.defendant = sanitize(data[2])

    @judgement.summary = sumary(content[1])
  end

  def set_judgement_notifications
    notifications = @body.css('div#listaAcuerdos')
    notifications_list = notifications[0].css('li')
    notifications_list.each_with_index do |item, idx|
      title = sanitize(item.css('h4').text)
      n = @judgement.notifications.find_or_initialize_by(title: title)
      next if n.persisted?
      n.body = sanitize(item.css('p.justify').text)
    end
  end

  def get_file_number_from_header
    @body.css('.header')[0].text.split(' ').last
  end

  def sumary content
    content_res = content.text
    content_res.slice!("RESUMEN: ")
    content_res.strip
  end

  def sanitize str
    Nokogiri::HTML(str).text.strip
  end
end