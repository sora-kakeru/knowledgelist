class OffersController < ApplicationController
  def index
    @offers = Offer.page(params[:page]).per(10)

    render("offers/index.html.erb")
  end

  def show
    @want_offer = WantOffer.new
    @offer_tag = OfferTag.new
    @offer = Offer.find(params[:id])

    render("offers/show.html.erb")
  end

  def new
    @offer = Offer.new

    render("offers/new.html.erb")
  end

  def create
    @offer = Offer.new

    @offer.counselor_id = params[:counselor_id]
    @offer.offers = params[:offers]

    save_status = @offer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/offers/new", "/create_offer"
        redirect_to("/offers")
      else
        redirect_back(:fallback_location => "/", :notice => "Offer created successfully.")
      end
    else
      render("offers/new.html.erb")
    end
  end

  def edit
    @offer = Offer.find(params[:id])

    render("offers/edit.html.erb")
  end

  def update
    @offer = Offer.find(params[:id])

    @offer.counselor_id = params[:counselor_id]
    @offer.offers = params[:offers]

    save_status = @offer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/offers/#{@offer.id}/edit", "/update_offer"
        redirect_to("/offers/#{@offer.id}", :notice => "Offer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Offer updated successfully.")
      end
    else
      render("offers/edit.html.erb")
    end
  end

  def destroy
    @offer = Offer.find(params[:id])

    @offer.destroy

    if URI(request.referer).path == "/offers/#{@offer.id}"
      redirect_to("/", :notice => "Offer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Offer deleted.")
    end
  end
end
