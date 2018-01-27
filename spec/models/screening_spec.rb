# == Schema Information
#
# Table name: screenings
#
#  id            :uuid             not null, primary key
#  manager_id    :integer          not null
#  title         :string           not null
#  body          :text             not null
#  showing_start :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (manager_id => users.id)
#

require "rails_helper"

RSpec.describe Screening, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
