class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @top_chef = User.all.sample
    @four_meals = Meal.where(user: @top_chef).first(4)
    @six_meals = Meal.last(6)
  end

  def dashboard
    @meals = current_user.meals
    @conversations = Conversation.where(sender_id: current_user.id).or(Conversation.where(recipient_id: current_user.id))
    if @conversations.any?

      if params[:selected_conversation]
        @conversation = Conversation.find(params[:selected_conversation])
        @messages = @conversation.messages
      else
        @conversation = @conversations.first
        @messages = @conversation.messages
      end
      @message = Message.new

    end
  end

end
