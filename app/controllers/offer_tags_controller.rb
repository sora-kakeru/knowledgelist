class OfferTagsController < ApplicationController
  def index
    @offer_tags = OfferTag.page(params[:page]).per(10)

    render("offer_tags/index.html.erb")
  end

  def show
    @offer_tag = OfferTag.find(params[:id])

    render("offer_tags/show.html.erb")
  end

  def new
    @offer_tag = OfferTag.new

    render("offer_tags/new.html.erb")
  end

  def create
    @offer_tag = OfferTag.new

    @offer_tag.offer_id = params[:offer_id]
    @offer_tag.tag_id = params[:tag_id]

    save_status = @offer_tag.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/offer_tags/new", "/create_offer_tag"
        redirect_to("/offer_tags")
      else
        redirect_back(:fallback_location => "/", :notice => "Offer tag created successfully.")
      end
    else
      render("offer_tags/new.html.erb")
    end
  end

  def edit
    @offer_tag = OfferTag.find(params[:id])

    render("offer_tags/edit.html.erb")
  end

  def update
    @offer_tag = OfferTag.find(params[:id])

    @offer_tag.offer_id = params[:offer_id]
    @offer_tag.tag_id = params[:tag_id]

    save_status = @offer_tag.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/offer_tags/#{@offer_tag.id}/edit", "/update_offer_tag"
        redirect_to("/offer_tags/#{@offer_tag.id}", :notice => "Offer tag updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Offer tag updated successfully.")
      end
    else
      render("offer_tags/edit.html.erb")
    end
  end

  def destroy
    @offer_tag = OfferTag.find(params[:id])

    @offer_tag.destroy

    if URI(request.referer).path == "/offer_tags/#{@offer_tag.id}"
      redirect_to("/", :notice => "Offer tag deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Offer tag deleted.")
    end
  end
end
