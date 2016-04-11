class PinsController < ApplicationController
	before_action :set_pin, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@pins = Pin.all.order('created_at DESc')
	end

	def show

	end

	def new
		@pin = current_user.pins.build
	end

	def create 
		@pin = current_user.pins.build(pins_params)
		if @pin.save
			redirect_to @pin, notice: 'Successfully Creates...'
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
		if @pin.update_attributes(pins_params)
			redirect_to @pin, notice: 'Successfully Updated...'
		else
			render 'edit'
		end
	end 

	def destroy
		@pin.destroy
		redirect_to pins_path
	end

	private

	def pins_params
		params.require(:pin).permit(:title, :discription, :image)
	end

	def set_pin
		@pin = Pin.find(params[:id])
	end

end
