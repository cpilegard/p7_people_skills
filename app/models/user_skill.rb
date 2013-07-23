class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  after_initialize :init

  def init
    self.proficiency ||= 0
  end
end
