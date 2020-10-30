# frozen_string_literal: true

require 'net/http'
require 'api'

class PostsController < ApplicationController
  include Api
  def index
    render json: Api.jsonplaceholder
  end

  def show
    render json: Api.jsonplaceholder[params[:id].to_i - 1]
  end
end
