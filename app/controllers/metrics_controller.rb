class MetricsController < ApplicationController
  def index
    @metrics = @hoopla_client.get("metrics",{}).sort_by { | m | [ m["name"] ]}
  end

  def show
    @id = params[:id]
    @musers = @hoopla_client.get("users",{}).sort_by { | u | [ u["first_name"], u["last_name"] ]}
    @mvalues = @hoopla_client.get("metrics/#{@id}/values",{})

    @musers.each do | muser |
      muser["value"] = @mvalues.select { | mv | mv["owner"]["href"] == muser["href"]}.first
      muser["value"] = muser["value"].present? ? muser["value"]["value"] : 0
    end
  end

  def new
    @user_id = params["user_id"]
    @metric_id = params["metric_id"]
    @muser = @hoopla_client.get("users/#{@user_id}",{})
    @metric = @hoopla_client.get("metrics/#{@metric_id}",{})
  end

  def create
    @user_id = params["user_id"]
    @metric_id = params["metric_id"]
    @value = params["metric_value"]

    params  = "{ \"owner\":{ \"kind\": \"user\", \"href\": \"https://api.hoopla.net/users/#{@user_id}\" }, \"value\": #{@value} }"
    @hoopla_client.post("/metrics/#{@metric_id}/values", params )
    redirect_to "/metrics/#{@metric_id}"
  end
end
