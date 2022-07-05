class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: "Welcome To The Home Page Of Todo App Using Ruby"
  end


  def showAllTasks
    render :json => Todo.all
  end

  def findById
    begin
      reqTask = Todo.find(params[:id])
      render json: reqTask
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

  def addTask
    newTask = Todo.new(params.permit(:taskName,:done))
    newTask.save
    render json: "Successfully Added"
  end

  def updateById
    begin
      task = Todo.find(params[:id])
      task.update(taskName: params[:taskName], done: params[:done])
      render json: "Successfully Updated"
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

  def deleteById
    begin
      task = Todo.find(params[:id])
      task.destroy
      render json: "Successfully Deleted"
    rescue ActiveRecord::RecordNotFound
      render json: "No such record exist"
    end
  end

end

