class Project < ApplicationRecord
    has_many :time_logs, dependent: :destroy
end
