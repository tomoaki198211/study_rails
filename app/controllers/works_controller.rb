class WorksController < ApplicationController
  before_action :set_work, only: %w(show edit update destroy)

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.build(work_params)
    if @work.save
      redirect_to works_path, notice:"登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to works_path, notice:"更新しました"
    else
      render :edit
    end
  end

  def destroy
    if @work.destroy
      redirect_to works_path, notice:"削除しました"
    end
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:title,:content)
  end

end
