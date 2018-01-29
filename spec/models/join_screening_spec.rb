# == Schema Information
#
# Table name: join_screenings
#
#  id           :integer          not null, primary key
#  screening_id :integer          not null
#  user_id      :integer          not null
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "rails_helper"

RSpec.describe JoinScreening, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
