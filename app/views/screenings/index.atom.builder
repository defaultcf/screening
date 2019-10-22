atom_feed do |feed|
  feed.title "上映情報一覧"
  feed.updated @screenings.order("created_at DESC").limit(1)[0].created_at

  @screenings.each do |screening|
    feed.entry screening, url: screening_url(screening) do |entry|
      entry.title screening.title
      entry.content screening.content, type: "text"
      entry.author do |author|
        author.name screening.manager.profile.nickname
      end
    end
  end
end
