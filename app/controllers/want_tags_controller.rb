class WantTagsController < ApplicationController
  def index
    @want_tags = WantTag.page(params[:page]).per(10)

    render("want_tags/index.html.erb")
  end

  def show
    @want_tag = WantTag.find(params[:id])

    render("want_tags/show.html.erb")
  end

  def new
    @want_tag = WantTag.new

    render("want_tags/new.html.erb")
  end

  def create
    @want_tag = WantTag.new

    @want_tag.want_id = params[:want_id]
    @want_tag.tag_id = params[:tag_id]

    save_status = @want_tag.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/want_tags/new", "/create_want_tag"
        redirect_to("/want_tags")
      else
        redirect_back(:fallback_location => "/", :notice => "Want tag created successfully.")
      end
    else
      render("want_tags/new.html.erb")
    end
  end

  def edit
    @want_tag = WantTag.find(params[:id])

    render("want_tags/edit.html.erb")
  end

  def update
    @want_tag = WantTag.find(params[:id])

    @want_tag.want_id = params[:want_id]
    @want_tag.tag_id = params[:tag_id]

    save_status = @want_tag.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/want_tags/#{@want_tag.id}/edit", "/update_want_tag"
        redirect_to("/want_tags/#{@want_tag.id}", :notice => "Want tag updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Want tag updated successfully.")
      end
    else
      render("want_tags/edit.html.erb")
    end
  end

  def destroy
    @want_tag = WantTag.find(params[:id])

    @want_tag.destroy

    if URI(request.referer).path == "/want_tags/#{@want_tag.id}"
      redirect_to("/", :notice => "Want tag deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Want tag deleted.")
    end
  end
end
