class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    # response_text = "New todo created with id: #{new_todo.id}"
    # render plain: response_text
    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    # render plain: "Completion status updated for todo #{id} to #{completed}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
