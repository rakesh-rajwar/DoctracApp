class ApiController < ApplicationController
  before_action -> { doorkeeper_authorize! :api }
  before_action :doorkeeper_authorize! # Require access token for all actions
end
