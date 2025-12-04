module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users
      end

      def show
        user = User.find(params[:id])
        render json: user
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { error: { message: "Validation failed", details: user.errors.full_messages } }, status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: { message: "deleted", id: user.id }
      end

      private

      def user_params
        params.require(:user).permit(:name)
      end
    end
  end
end
