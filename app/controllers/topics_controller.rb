class TopicsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.where('name like ?', "%#{params[:term]}%")
    respond_to do |format|
      format.json { render :json => @tags.collect{|t| {id: t.id, label: t.name, value: t.name } }}
    end
  end
end

