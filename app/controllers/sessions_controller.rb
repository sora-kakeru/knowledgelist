class SessionsController < ApplicationController
  def index
    @q = Session.ransack(params[:q])
    @sessions = @q.result(:distinct => true).includes(:want_offer, :user, :want, :offer).page(params[:page]).per(10)

    render("sessions/index.html.erb")
  end

  def show
    @session = Session.find(params[:id])

    render("sessions/show.html.erb")
  end

  def new
    @session = Session.new

    render("sessions/new.html.erb")
  end

  def create
    @session = Session.new

    @session.date_time = params[:date_time]
    @session.comment = params[:comment]
    @session.user_stars = params[:user_stars]
    @session.offer_stars = params[:offer_stars]
    @session.want_offer_id = params[:want_offer_id]

    save_status = @session.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sessions/new", "/create_session"
        redirect_to("/sessions")
      else
        redirect_back(:fallback_location => "/", :notice => "Session created successfully.")
      end
    else
      render("sessions/new.html.erb")
    end
  end

  def edit
    @session = Session.find(params[:id])

    render("sessions/edit.html.erb")
  end

  def update
    @session = Session.find(params[:id])

    @session.date_time = params[:date_time]
    @session.comment = params[:comment]
    @session.user_stars = params[:user_stars]
    @session.offer_stars = params[:offer_stars]
    @session.want_offer_id = params[:want_offer_id]

    save_status = @session.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sessions/#{@session.id}/edit", "/update_session"
        redirect_to("/sessions/#{@session.id}", :notice => "Session updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Session updated successfully.")
      end
    else
      render("sessions/edit.html.erb")
    end
  end

  def destroy
    @session = Session.find(params[:id])

    @session.destroy

    if URI(request.referer).path == "/sessions/#{@session.id}"
      redirect_to("/", :notice => "Session deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Session deleted.")
    end
  end
end
