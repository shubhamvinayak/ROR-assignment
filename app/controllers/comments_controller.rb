# frozen_string_literal: true

require 'net/http'
require 'api'

class CommentsController < ApplicationController
  include Api
  def index
    render json: Api.jsonplaceholder[params[:post_id].to_i - 1][:comments]
  end

  def show
    render json: Api.jsonplaceholder[params[:post_id].to_i - 1][:comments][params[:id].to_i - 1]
  end
end