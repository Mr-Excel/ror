# frozen_string_literal: true

class HelloWorldController < ApplicationController
  layout "react"

  def index
    users = User.all
    @data = {:users => users}
  end
end
