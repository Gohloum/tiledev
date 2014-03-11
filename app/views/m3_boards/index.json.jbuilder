json.array!(@m3_boards) do |m3_board|
  json.extract! m3_board, :id, :name, :data
  json.url m3_board_url(m3_board, format: :json)
end
