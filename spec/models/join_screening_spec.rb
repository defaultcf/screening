# == Schema Information
#
# Table name: join_screenings
#
#  id           :bigint(8)        not null, primary key
#  screening_id :uuid             not null
#  user_id      :bigint(8)        not null
#  message      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "rails_helper"

RSpec.describe JoinScreening, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
