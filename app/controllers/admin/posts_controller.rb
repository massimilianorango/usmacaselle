class Admin::PostsController < AuthAdminController
    before_action :correct_sector, only: [:edit, :update, :destroy]

    def index
        @posts = @sector.posts.paginate(page: params[:page], per_page: 10)
    end

    def new
        @post = current_sector.posts.build
    end

    def create
        @post = current_sector.posts.build(post_params)
        if @post.save
            flash[:success] = "Post inserito con successo!"
            redirect_to admin_posts_url
        else
            @post.errors.delete(:image)
            render 'new'
        end
    end

    def edit

    end

    def update
        @post.lead_image.clear if params[:delete_lead_image] == 'yes'
        if @post.update_attributes(post_params)
            flash[:success] = "Post modificato correttamente!"
            redirect_to admin_posts_url
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to admin_posts_path
    end

    private
    def correct_sector
        @post = current_sector.posts.find_by(id: params[:id])
        redirect_to admin_url if @post.nil?
    end

    private
    def post_params
        params.require(:post).permit(:title, :lead_image, :content)
    end
end
