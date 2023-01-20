class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]

    def index
        @profiles = Profile.all
    end

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.new(profile_params)
        if @profile.save
            respond_to do |format|
                format.html { redirect_to profiles_path, notice: "Profile Saved Successfully!" }
                format.turbo_stream
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @profile.update(profile_params)
            respond_to do |format|
                format.html { redirect_to profiles_path, notice: "Profile was updated successfully!" }
                format.turbo_stream { redirect_to profiles_path }
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @profile.destroy
        respond_to do |format|
            format.html { redirect_to profiles_path, flash.now[:notice] = 'Profile deleted successfully' }
            format.turbo_stream
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:image, :name, :contact_no)
    end

    def set_profile
        @profile = Profile.find(params[:id])
    end
end
