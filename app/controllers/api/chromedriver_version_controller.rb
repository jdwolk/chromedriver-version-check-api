# frozen_string_literal: true

module API
  class ChromedriverVersionController < BaseController
    rescue_from StandardError, with: :render_errors

    def show
      queryable = chrome_version.split('.').take(3).join('.')
      url = "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_#{queryable}"
      result = HTTP.get(url)

      to_return =
        if result.status == 200
          {
            json: {
              chromedriver_version: result.to_s
            }.to_json,
            status: 200
          }
        else
          { json: nil, status: 400 }
        end

      render to_return
    end

    private

    def chrome_version
      params.require(:chrome_version)
    end

    def render_errors
      render json: nil, status: 400
    end
  end
end
