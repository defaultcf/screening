# == Schema Information
#
# Table name: relations
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe Relation, type: :model do
  let(:relation) { FactoryBot.build(:relation) }

  context "互いに存在するidで登録された時" do
    it "正常に関係が保存される" do
      expect(relation).to be_valid
    end
  end
end
