class User < ActiveRecord::Base
  has_many :user_skills
  has_many :skills, through: :user_skills

  def proficiency_for(skill_object)
  	skill = Skill.find(skill_object.id)
  	UserSkill.where(user_id: self.id, skill_id: skill.id).first.proficiency
  end

  def set_proficiency_for(skill_object, prof)
  	skill = Skill.find(skill_object.id)
  	user_skill = UserSkill.where(user_id: self.id, skill_id: skill.id).first
  	UserSkill.update(user_skill.id, proficiency: prof)
  end
end
