class PlansController < ApplicationController
	def index
		@plans = current_user.plans
	end

	def show
		@plan = current_user.plans.find(params[:id])
	end

	def new
		@plan = current_user.plans.create
	end

	def edit
		@plan = current_user.plans.find(params[:id])
	end

	def create
		@plan = current_user.plans.create(plan_params)
		if @plan.save
			redirect_to @plan
		else
			render 'new'
		end
	end

	def update
		@plan = current_user.plans.find(params[:id])
		if @plan.update(plan_params)
			redirect_to @plan
		else
			render 'edit'
		end
	end

	def destroy
		@plan = current_user.plans.find(params[:id])
		@plan.destroy
		redirect_to plans_path
	end

	private

	def plan_params
		params.require(:plan).permit(:title)
	end
end

