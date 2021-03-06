# frozen_string_literal: true

module Api
  module Internal
    class ActivitiesController < Api::Internal::ApplicationController
      def index(username: nil, page: nil)
        return head(404) if username.blank? && !user_signed_in?

        activities = if username.blank?
          current_user.following_activities
        else
          User.where(username: username).first&.activities.presence || Activity.none
        end

        @user = current_user
        @activities = activities.
          order(id: :desc).
          includes(:work, user: :profile).
          page(page)

        @works = Work.where(id: @activities.pluck(:work_id))
      end
    end
  end
end
