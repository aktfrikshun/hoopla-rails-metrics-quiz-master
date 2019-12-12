module MetricsHelper

  def external_id(href)
    href.split("/").last
  end

end
