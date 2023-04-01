class RelationshipsController < ApplicationController
  def index
    @relations = Relationship.all
    render json: @relations
  end
end
