class CounselorLikesController < ApplicationController
  def index
    @q = CounselorLike.ransack(params[:q])
    @counselor_likes = @q.result(:distinct => true).includes(:counselor, :want).page(params[:page]).per(10)

    render("counselor_likes/index.html.erb")
  end

  def show
    @counselor_like = CounselorLike.find(params[:id])

    render("counselor_likes/show.html.erb")
  end

  def new
    @counselor_like = CounselorLike.new

    render("counselor_likes/new.html.erb")
  end

  def create
    @counselor_like = CounselorLike.new

    @counselor_like.want_id = params[:want_id]
    @counselor_like.counselor_id = params[:counselor_id]
    @counselor_like.like = params[:like]

    save_status = @counselor_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/counselor_likes/new", "/create_counselor_like"
        redirect_to("/counselor_likes")
      else
        redirect_back(:fallback_location => "/", :notice => "Counselor like created successfully.")
      end
    else
      render("counselor_likes/new.html.erb")
    end
  end

  def edit
    @counselor_like = CounselorLike.find(params[:id])

    render("counselor_likes/edit.html.erb")
  end

  def update
    @counselor_like = CounselorLike.find(params[:id])

    @counselor_like.want_id = params[:want_id]
    @counselor_like.counselor_id = params[:counselor_id]
    @counselor_like.like = params[:like]

    save_status = @counselor_like.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/counselor_likes/#{@counselor_like.id}/edit", "/update_counselor_like"
        redirect_to("/counselor_likes/#{@counselor_like.id}", :notice => "Counselor like updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Counselor like updated successfully.")
      end
    else
      render("counselor_likes/edit.html.erb")
    end
  end

  def destroy
    @counselor_like = CounselorLike.find(params[:id])

    @counselor_like.destroy

    if URI(request.referer).path == "/counselor_likes/#{@counselor_like.id}"
      redirect_to("/", :notice => "Counselor like deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Counselor like deleted.")
    end
  end
end
