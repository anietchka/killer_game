json.extract! @game, :id, :name, :status, :game_type
json.players @game.players do |player|
  json.extract! player, :id, :name, :email, :status
end