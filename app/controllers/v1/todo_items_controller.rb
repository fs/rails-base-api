module V1
  class TodoItemsController < ApplicationController
    expose :todo_item, build_params: :resource_params
    expose :todo_items, -> { current_user.todo_items }

    acts_as_token_authentication_handler_for User, fallback: :exception
    before_action :authorize!, only: %i(show update destroy)

    def index
      respond_with todo_items
    end

    def show
      respond_with todo_item
    end

    def create
      todo_item.user = current_user
      todo_item.save
      respond_with todo_item
    end

    def update
      todo_item.update(resource_params)
      respond_with todo_item
    end

    def destroy
      todo_item.delete
      respond_with todo_item
    end

    private

    def authorize!
      authorize todo_item, :update?
    end
  end
end
