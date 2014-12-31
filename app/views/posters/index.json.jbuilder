json.array!(@posters) do |poster|
  json.extract! poster, :id, :subject, :content, :click, :author_id
  json.url poster_url(poster, format: :json)
end
