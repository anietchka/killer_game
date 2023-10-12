class PlayerService
  def create_admin(game_id, user_id)
    user = User.find(user_id)
    if user.present?
      player = Player.new(
              name: user.name, 
              email: user.email, 
              player_type: :admin, 
              status: :in_game,
              game_id: game_id,
              user_id: user_id)
      player.generate_player_code if player.save!
    end
  end
end