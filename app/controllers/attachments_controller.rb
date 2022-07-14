class AttachmentsController < ApplicationController
    def purge
      attachment = ActiveStorage::Attachment.find(params[:id])
      attachment.purge
      redirect_back fallback_location: profile_path, notice: "success"
    end
end