class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills

  validates_uniqueness_of :name

  def user_with_proficiency(prof)
  	user_skill = UserSkill.where(skill_id: self.id, proficiency: prof).first
 	User.find(user_skill.user_id)
  end
end
