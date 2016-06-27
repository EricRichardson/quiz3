class LikeNotificationMailer < ApplicationMailer

  def like_notification(idea)
    @idea = idea
    @owner = idea.user
    mail(to: @owner.email, subject: "Someone liked your idea") if @owner
  end
end
