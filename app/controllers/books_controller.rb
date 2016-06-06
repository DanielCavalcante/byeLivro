class BooksController < ApplicationController

  def index
    @books = current_user.books.page(params[:page]).per(8)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Livro cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def update
    @book = current_user.books.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: 'Informações atualizadas!'
    else
      render :edit
    end
  end

  def remove
    @book = current_user.books.find(params[:id])
  end

  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy!
    redirect_to books_path, notice: 'Livro removido!'
  end

  def picture_url
    @book.picture_url
  end

  def thumb_url
    @book.picture.thumb.url
  end

  def has_picture?
    @book.picture?
  end

  private

  def book_params
    params
    .require(:book)
    .permit(:title, :author, :isbn, :description, :picture)
  end

end
