class PjvScrapingService < ApplicationService
  attr_reader :url, :response
  
  def initialize url
    @url = url
    @response = {}
  end

  def call
    html = Nokogiri::HTML('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
      <html><body>
        <div class="block-flat">
          <div class="header">
            header header header header header header header
          </div>
          <div class="content">
            <p>
                   Mexico, DF > sdfgsdfg sdfgf<br>
                   Actor: asdfdasdf<br>
             Demandado: asdasdfasd
            </p>
          </div>
          <div class="content">
            RESUMEN: Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, aut dolor at qui a, nesciunt recusandae inventore est voluptatem quae minima, aliquam facilis iure? Dolor corporis tempore consequatur eos atque!
          </div>
          <div id="listaAcuerdosHead">
            <h4>titulo lista de Acuerdos</h4>
          </div>
          <div id="listaAcuerdos">
            <h3>
              titulo
            </h3>
            <li>
              <h4>dadsfasd</h4>
              <p class="justify">
              nota1: Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, aut dolor at qui a, nesciunt recusandae inventore est voluptatem quae minima, aliquam facilis iure? Dolor corporis tempore consequatur eos atque!
              </p>
            </li>
            <li>
              <h4>dadsfasd</h4>
              <p class="justify">
              nota2: Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, aut dolor at qui a, nesciunt recusandae inventore est voluptatem quae minima, aliquam facilis iure? Dolor corporis tempore consequatur eos atque!
              </p>
            </li>
          </div>
        </div>
      </body></html>')

    d = html.css('div.block-flat')[0]
    response[:header] = d.css('.header')[0]
    content = d.css('div.content')
    data_raw = content[0].to_s
    data = data_raw.split("<br>")
    response[:court_table] = (data[0])
    response[:claimant] = (data[1])
    response[:defendant] = (data[2])

    response[:summary] = (content[1].text)
    notifications = d.css('div#listaAcuerdos')
    notifications_list = notifications[0].css('li')
    notification = {}
    notifications_list.each do |item|
      notification[:title] = item.css('h4').text.strip
      notification[:body] = item.css('p.justify').text.strip
      response[:notifications][] = notification
    end

    response
  end
end