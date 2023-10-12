class Player < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  INITIALIZED = "initialized"
  IN_GAME = "in_game"
  KILLED = "killed"
  PLAYER = "player"
  ADMIN = "admin"
  PLAYER_TYPE = [PLAYER, ADMIN]
  STATUS = [INITIALIZED, IN_GAME, KILLED]
  validates :player_type, presence: true, inclusion: { in: PLAYER_TYPE }
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :name, presence: true
  validates :player_code, uniqueness: true, presence: false

  def generate_player_code
    self.player_code = "#{self.game_id}#{self.id}#{rand(10)}".to_i
    self.save
  end
end
