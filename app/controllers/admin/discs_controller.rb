class Admin::DiscsController < ApplicationController
  def new
  	@disc = Disc.new
  	@somg = @disc.songs.build
  end

  def edit
  end


private
    def disk_params
      params.require(:disk).permit(:disk_name, :songs_attributes => [:id, :title, :track_order, :_destroy])
    end
end
