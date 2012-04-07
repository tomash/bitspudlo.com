class Admin::TimetrackingsController < Admin::ResourceController
  before_filter :load_last_started

  def create
    @timetracking = Timetracking.new(params[:timetracking])
    @timetracking.user_id = current_user.id
    @timetracking.started_at = Time.now
    @timetracking.started_client_ip = request.remote_ip
    if @timetracking.save
      respond_with(@timetracking) do |format|
        format.html { redirect_to location_after_save }
        format.json { render :json => @timetracking.to_json }
      end
    else
      flash[:error] = I18n.t('errors.messages.could_not_create_timetracking')
      respond_with(@timetracking) do |format|
        format.html { redirect_to admin_timetrackings_url }
      end
    end
  end

  def update
    @timetracking.finished_at = Time.now
    @timetracking.finished_client_ip = request.remote_ip
    if @timetracking.save
      respond_with(@timetracking) do |format|
        format.html { redirect_to location_after_save }
        format.json { render :json => @timetracking.to_json }
      end
    else
      flash[:error] = I18n.t('errors.messages.could_not_update_timetracking')
      respond_with(@timetracking) do |format|
        format.html { redirect_to admin_timetrackings_url }
      end
    end
  end

  protected

  def build_resource
    @timetracking = Timetracking.new(params[:timetracking])
    @timetracking
  end

  def location_after_save
    admin_timetrackings_url
  end

  def load_last_started
    @last_started_timetracking = Timetracking.where(:user_id => current_user.id).where(:finished_at => nil).first
    #@calculators = Rails.application.config.spree.calculators.promotion_actions_create_adjustments
  end

  def collection
    Timetracking.order("created_at DESC")
  end

end
