class UserGroupsController < ApplicationController
  before_action :authenticate_user!, only: [ :join ]

  def index
    @user_groups = UserGroup.includes(:users).sort_by(&:total_score).reverse
  end

  def show
    @user_group = UserGroup.find_by!(slug: params[:id])
    @group_users = @user_group.users.order(score: :desc)
  end

  def join
    if current_user.grouped?
      redirect_to user_groups_path, alert: "You're already in a group."
      return
    end

    invite_code_or_slug = params[:invite_code].to_s.strip
    @user_group = UserGroup.joinable(invite_code_or_slug)

    if @user_group.nil?
      redirect_to user_groups_path, alert: "Invalid invite code or group not found."
    elsif @user_group.users.count >= 10
      redirect_to user_groups_path, alert: "This group is full."
    else
      current_user.update(user_group: @user_group)
      redirect_to user_group_path(@user_group.slug), notice: "You joined #{@user_group.name}!"
    end
  end

  def new
    if current_user.grouped?
      redirect_to user_groups_path, alert: "You're already in a group."
    else
      @user_group = UserGroup.new
    end
  end

  def create
    if current_user.grouped?
      redirect_to user_groups_path, alert: "You're already in a group."
      return
    end

    if UserGroup.exists?(creator_id: current_user.id)
      redirect_to user_groups_path, alert: "You've already created a group."
      return
    end

    @user_group = UserGroup.new(user_group_params)
    @user_group.creator = current_user

    if @user_group.save
      current_user.update(user_group: @user_group)
      redirect_to user_group_path(@user_group.slug), notice: "Group '#{@user_group.name}' created and joined!"
    else
      render :new
    end
  end

  def leaderboard
    @users = User.includes(:user_group).order(score: :desc)
  end

  private

  def user_group_params
    params.require(:user_group).permit(:name, :is_private, :invite_code)
  end
end
