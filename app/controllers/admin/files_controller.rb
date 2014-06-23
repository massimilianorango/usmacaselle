class Admin::FilesController < AuthAdminController

    def new
        @sector = current_sector
    end

    def create #TODO: CHECK on fail & path
        @sector = current_sector
        uploaded_io = params[:file]
        name = Digest::SHA1.hexdigest(Time.now.to_s)
        ext = File.extname(uploaded_io.original_filename)
        File.open(Rails.root.join('public', params[:type], name + ext), 'wb') do |file|
            file.write(uploaded_io.read)
            uploaded_file_url = "http://www.usmacaselle.it/public/" + params[:type] + "/" + name + ext
            flash[:success] = "Caricamento effettuato con successo!"
        redirect_to new_admin_file_path(:uploaded_file_url => uploaded_file_url)
        end
    end

    def correct_sector
    end
end
