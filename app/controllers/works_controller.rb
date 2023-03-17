class WorksController < ApplicationController
  before_action :set_work, only: %w(show edit destroy)

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    if @work.create(work_params)
      redirect_to works_path, notice:"登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
    # set_work
  end

  def update
    if @task.update(work_params)
      redirect_to works_path, notice:"更新しました"
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_work
    @work = Work.find_by(params[:id])
  end

  def work_params
    params.require(:work).permit(:title,:content)
  end


end
