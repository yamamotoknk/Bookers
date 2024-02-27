  Rails.application.routes.draw do
  root to: 'homes#top'
  resources :books, expect: [:show, :new, :edit]
	get 'books' =>'books#index'
	post 'books' => 'books#create'
	get 'books/:id' => 'books#show', as: 'book'
	get 'books/:id/edit' => 'books#edit', as: 'edit_list'
	patch 'books/:id' => 'books#update', as: 'update_book'
	put 'books/:id' => 'books#update'
	delete 'books/:id' => 'books#destroy'
	end 