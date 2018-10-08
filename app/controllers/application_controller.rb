# frozen_string_literal: true

class ApplicationController < ActionController::API
  # reason for `raise: false`
  # @see https://github.com/nsarno/knock/issues/138#issuecomment-279252093
  skip_before_action :authorize_request, only: :authenticate, raise: false

  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user


  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
