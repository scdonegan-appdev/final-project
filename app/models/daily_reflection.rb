# == Schema Information
#
# Table name: daily_reflections
#
#  id              :integer          not null, primary key
#  reflection_text :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class DailyReflection < ApplicationRecord
    belongs_to :user
    validates :user_id, :presence => true
    validates :reflection_text, :presence => { :message => "Please fill out a reflection, thank you!" } 
end
