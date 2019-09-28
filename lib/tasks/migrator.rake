namespace :migrator do
  desc "Activate ActionText from SimpleMDE"
  task activate_actiontext: :environment do
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

    Screening.find_each do |screening|
      next unless screening.content.to_s.empty?
      screening.update content: markdown.render(screening.body)
    end
  end
end
