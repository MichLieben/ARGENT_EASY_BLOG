class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to root_path, notice: "Merci de votre inscription!"
    else
      redirect_to root_path, notice: "Il semblerait qu'il y ait eu un souci lors de votre inscription à la newsletter"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:firstname, :name, :email)
  end
end
