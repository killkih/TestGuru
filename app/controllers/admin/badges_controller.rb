class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show destroy update edit]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.created_badges.build(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: t('.create.created')
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t('.update.updated')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.destroy.deleted')
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :icon_url, :condition, :option)
  end
end
