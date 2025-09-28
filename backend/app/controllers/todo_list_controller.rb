# frozen_string_literal: true

class TodoListController < ApplicationController

  before do
    authenticate!
  end

  get '/' do
    @todos = TodoList.all
    erb :todo_lists
  end

  post '/' do
    TodoList.create!(
      name: params[:name],
      description: params[:description]
    )
    redirect request.env['HTTP_REFERER']
  end

  get '/new' do
    erb :todo_list_new
  end

  get '/:id' do
    @todo_list = TodoList.find(params[:id])
    erb :todo_list
  end

  post '/:id/items' do
    todo_list = TodoList.find(params[:id])
    todo_list.todo_items.create!({ task: params[:task] })
    redirect request.env['HTTP_REFERER']
  end

  patch '/:id/items/:item' do
    todo_item = TodoItem.find(params[:item])
    todo_item.done = params[:done]&.downcase == 'true'
    todo_item.task = params[:task] if params[:task]
    todo_item.save!
  end

  post '/:id/items/:item/check' do
    todo_item = TodoItem.find(params[:item])
    todo_item.done = true
    todo_item.save!
  end

  post '/:id/items/:item/uncheck' do
    todo_item = TodoItem.find(params[:item])
    todo_item.done = false
    todo_item.save!
  end

  delete '/:id/items/:item' do
    todo_item = TodoItem.find(params[:item])
    todo_item.delete
  end
end
