class DocumentsController < ApplicationController
  before_action :authenticate_with_http_digest, except: %i[index show]
  before_action :require_user_logged_in!

  def index
    @jobs=Current.user.jobs.joins(:bids).where(bids: {status: "Accepted"})
    @bids=Current.user.bids.where(status: "Accepted").order(updated_at: :desc)
  end
end