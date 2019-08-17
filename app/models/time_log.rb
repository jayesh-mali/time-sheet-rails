class TimeLog < ApplicationRecord
  belongs_to :project

  validates :hours, presence: true, numericality: { less_than_or_equal_to: 24 }

  validate :validate_total_hours

  def self.get_all_time_logs
    user = User.first
    timelog = TimeLog.where(created_by_id:user.id)
    return timelog.group_by(&:date)
  end

  def self.create_time_logs(time_log_entries)
    user = User.first
    ActiveRecord::Base.transaction do
      time_log_entries.each do |time_log_entry|
        time_log = TimeLog.new(time_log_entry)
        time_log.assign_attributes(date: Time.zone.now.to_date, created_by_id: user.id, updated_by_id: user.id)
        time_log.save!
      end
    end
  end

  private
  def validate_total_hours
    errors.add(:invalid_hours, "Your total hours can not exceed by 24 hours") if TimeLog.where(date:date,created_by_id:created_by_id).sum(:hours) > (24 - hours)
  end
end
