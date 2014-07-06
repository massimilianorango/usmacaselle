class Admin::UploadedFilesController < AuthAdminController
    before_action :correct_sector, only: []

    def new
        @new_uploaded_file = UploadedFile.new
    end

    def create
        @uploaded_file = UploadedFile.new(uploaded_file_params)
        @uploaded_file.uploaded_by = current_sector.id
        if @uploaded_file.save
            flash[:success] = "Caricamento effettuato con successo!"
            redirect_to new_admin_uploaded_file_path(:uploaded_url => @uploaded_file.attachment.url)
        else
            @new_uploaded_file = UploadedFile.new
            render 'new'
        end
    end

    private
    def uploaded_file_params
        params.require(:uploaded_file).permit(:attachment, :att_type)
    end
end