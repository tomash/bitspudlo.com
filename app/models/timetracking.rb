class Timetracking < ActiveRecord::Base
  belongs_to :user

  def client_ip
    [self.started_client_ip, self.finished_client_ip].join(" -> ")
  end

  def logged_time
    [self.started_at, self.finished_at].join(" -> ")
  end

  def distance_in_hours
    return 0 if(started_at.blank? || finished_at.blank?)
    ((self.finished_at - self.started_at) / 1.hour).round
  end

  def distance_in_minutes
    return 0 if(started_at.blank? || finished_at.blank?)
    ((self.finished_at - self.started_at) / 1.minute).round
  end

  def time_worked_array
    [distance_in_hours, (distance_in_minutes-(distance_in_hours*60))]
  end
end
