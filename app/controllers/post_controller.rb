# frozen_string_literal: true

class PostController < ApplicationController
  def index
    @jobs = Job.all.order('created_at desc').limit(4)
    @profiles = Profile.all
  end
end
