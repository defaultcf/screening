xml.instruct! :xml, version: "1.0"
xml.rss("version": "2.0", "xmlns:dc": "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title "上映情報一覧"
    xml.description "上映情報の一覧"
    xml.link screenings_url

    @screenings.each do |screening|
      xml.item do
        xml.title screening.title
        xml.description screening.body
        xml.pubDate screening.created_at.to_s(:rfc822)
        xml.guid screening_url(screening)
        xml.link screening_url(screening)
      end
    end
  end
end
