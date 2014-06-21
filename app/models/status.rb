# == Schema Information
#
# Table name: statuses
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#  utc_seconds :integer
#

class Status < ActiveRecord::Base
  before_save :add_utc_seconds

  private

  def add_utc_seconds
    self.utc_seconds = Time.now.to_i
  end
end
