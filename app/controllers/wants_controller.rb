class WantsController < ApplicationController
  def index
    @wants = Want.all

    render("wants/index.html.erb")
  end

  def show
    @want = Want.find(params[:id])

    render("wants/show.html.erb")
  end

  def new
    @want = Want.new

    render("wants/new.html.erb")
  end

  def create
    @want = Want.new

    @want.user_id = params[:user_id]
    @want.wants = params[:wants]

    save_status = @want.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/wants/new", "/create_want"
        redirect_to("/wants")
      else
        redirect_back(:fallback_location => "/", :notice => "Want created successfully.")
      end
    else
      render("wants/new.html.erb")
    end
  end

  def edit
    @want = Want.find(params[:id])

    render("wants/edit.html.erb")
  end

  def update
    @want = Want.find(params[:id])

    @want.user_id = params[:user_id]
    @want.wants = params[:wants]

    save_status = @want.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/wants/#{@want.id}/edit", "/update_want"
        redirect_to("/wants/#{@want.id}", :notice => "Want updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Want updated successfully.")
      end
    else
      render("wants/edit.html.erb")
    end
  end

  def destroy
    @want = Want.find(params[:id])

    @want.destroy

    if URI(request.referer).path == "/wants/#{@want.id}"
      redirect_to("/", :notice => "Want deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Want deleted.")
    end
  end
end