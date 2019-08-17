class TimeLogsController < ApplicationController
  def index
    @time_logs = TimeLog.includes(:project).get_all_time_logs
    serializers = @time_logs.map do |date,logs|
        [date, ActiveModel::Serializer::CollectionSerializer.new(logs,each_serializer: TimeLogSerializer)]
    end
    render json: serializers.to_h, status: :ok
  end

  def create
    begin
      time_logs = TimeLog.create_time_logs(create_params["time_logs"])
      render json: { message: "Time Log entries created successfully" }, status: :created
    rescue ActiveRecord::RecordInvalid => error
      render json: { message: error.message }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(time_logs: [:description, :project_id, :hours])
  end
end
