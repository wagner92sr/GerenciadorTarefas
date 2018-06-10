class TasksController < ApplicationController
   def index
      @tasks = Task.all
   end

   def new
      @task = Task.new
   end

   def edit
   end

   def create
      @task = Task.new(task_params)

      if @task.save
         redirect_to tasks_path, notice: 'Tarefa criada com sucesso'
      else
         flash.now[:error] = @task.errors.full_messages.to_sentence
         render :new
      end
   end

   def update
      if @task.update(task_params)
         redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso'
      else
         flash.now[:error] = @task.errors.full_messages.to_sentence
         render :edit
      end
   end

   def destroy
      redirect_to tasks_path, notice: 'Tarefa removida com sucesso'
   end

   private
   def task_params
      params.require(:task).permit(:name, :details, :due_date, :category_id)
   end
end