class WantOffersController < ApplicationController
  def index
    @want_offers = WantOffer.page(params[:page]).per(10)

    render("want_offers/index.html.erb")
  end

  def show
    @want_offer = WantOffer.find(params[:id])

    render("want_offers/show.html.erb")
  end

  def new
    @want_offer = WantOffer.new

    render("want_offers/new.html.erb")
  end

  def create
    @want_offer = WantOffer.new

    @want_offer.offer_id = params[:offer_id]
    @want_offer.want_id = params[:want_id]
    @want_offer.match = params[:match]

    save_status = @want_offer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/want_offers/new", "/create_want_offer"
        redirect_to("/want_offers")
      else
        redirect_back(:fallback_location => "/", :notice => "Want offer created successfully.")
      end
    else
      render("want_offers/new.html.erb")
    end
  end

  def edit
    @want_offer = WantOffer.find(params[:id])

    render("want_offers/edit.html.erb")
  end

  def update
    @want_offer = WantOffer.find(params[:id])

    @want_offer.offer_id = params[:offer_id]
    @want_offer.want_id = params[:want_id]
    @want_offer.match = params[:match]

    save_status = @want_offer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/want_offers/#{@want_offer.id}/edit", "/update_want_offer"
        redirect_to("/want_offers/#{@want_offer.id}", :notice => "Want offer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Want offer updated successfully.")
      end
    else
      render("want_offers/edit.html.erb")
    end
  end

  def destroy
    @want_offer = WantOffer.find(params[:id])

    @want_offer.destroy

    if URI(request.referer).path == "/want_offers/#{@want_offer.id}"
      redirect_to("/", :notice => "Want offer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Want offer deleted.")
    end
  end
end
