class ItemsController < ApplicationController

  layout false
  skip_before_action :verify_authenticity_token

  def index # Показывает все что есть в базе данных
    @items = Item.all
      render body: @items.map { |i| "#{i.name}: #{i.price}"}
  end

  def create # Создает обьект в базу
    item = Item.create(items_params)
    if item.persisted?
      render json: item.name, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def new # Рендерит форму и посылается методу create
   # создаем новый объект модели item и присваиваем его переменной экземпляра
  end

  def show # Показыает item по текущему id
  end

  def edit # При вызове метода edit он будет посылатся на метод update
  end

  def update # Обновляет обьект в базе данных
  end

  def destroy # Удаляет обьект с базы данных
  end

  private

  def items_params
    params.permit(:name, :price, :real, :weight, :description,)
  end

end
