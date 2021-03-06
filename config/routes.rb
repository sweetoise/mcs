Mcs::Application.routes.draw do
 


  get "second_semester_course_video_tutorial/show"

  get "first_semester_course_video_tutorial/show"

  get "activated/index"

  get "second_semester_questions_and_solutions/index"

  get "second_semester_questions_and_solutions/show"

  get "first_semester_questions_and_solutions/index"

  get "first_semester_questions_and_solutions/show"

  get "past_questions_update_second_semester_course/show"

  get "past_questions_update_first_semester_course/show"

  get "second_semester_library_book_outline/show"

  get "second_update_semester_course/show"

  get "second_semester_course_outline/show"
  match '/first-semester-course/library_book', to: 'user_first_semester_library_book#show'
  match '/second-semester-course/library_book', to: 'user_second_semester_library_book#show'
  match '/first-semester/course', to: 'user_first_semester_course#show'
  match '/second-semester/course', to: 'user_second_semester_course#show'
  match 'payment_method/bank', to: 'payment_method#bank_transfer'
  match '/first-semester-course/view_library_book', to: 'update_semester_course#show'
  match '/second-semester-course/view_library_book', to: 'second_update_semester_course#show'
  match '/course/topic', to: 'first_semester_course_outline#show'



  get "account/active_subscription"
  get "account/expired_subscription"
  get "first_semester_library_book_outline/show"
  get "scan/pin_attempt"
  get "payment_method/bank_transfer"
  get "contact_us/index"
  get "contact_us/home"
  get "get_help/index"
  get "get_help/view"
  get "questions_and_solutions/index"
  get "library/books"





  resources :updateusers
  resources :updatefacultys
  resources :updatedepartments
  resources :verifylevels




  resources :terms_of_uses
  resources :titles
  resources :nationalities
  resources :state_of_origins
  resources :privacy_terms
  resources :empty_selects
  resources :email_addresses
  resources :copywrite_terms
  resources :copywrite_addresses
  resources :table_of_contents
  resources :faqs
  resources :events
  resources :updates

  resources :verifypins, only: [:new, :create, :destroy]
  match '/payment_method/voucher', to: 'verifypins#new'
  match '/deletepin', to: 'verifypins#destroy', via: :delete

  get "login/index"
  get "mainpage/index"
  get "administrator/index"
  get "listings/index"
  get "passthrough/index"

  namespace :administrator do |admin|
    resources :institutions
    resources :faculties
    resources :departments
    resources :levels
    resources :pins
    resources :first_semester_courses
    resources :first_semester_course_outlines
    resources :first_semester_library_books
    resources :first_semester_library_book_outlines
    resources :first_semester_past_questions
    resources :second_semester_courses
    resources :second_semester_course_outlines
    resources :second_semester_library_books
    resources :second_semester_library_book_outlines
    resources :second_semester_past_questions
    resources :institution_ads
    resources :faculty_ads
    resources :institution_updates
    resources :institution_notices
    resources :faculty_updates
    resources :faculty_notices
    resources :department_updates
    resources :department_notices

    resources :course_types
    resources :semesters

  end

  devise_for :users, :controllers => {:registrations => "listings", :sessions => "login"}

  devise_scope :user do
    authenticated :user do
      root :to => 'passthrough#index'
    end
    unauthenticated :user do
      root :to => 'listings#index'
    end
    get "/users/sign_out", :to => "devise/sessions#destroy"
  end

  resources :listings

  resources :users

# The priority is based upon order of creation:
# first created -> highest priority.

# Sample of regular route:
#   match 'products/:id' => 'catalog#view'
# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Sample resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Sample resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Sample resource route with more complex sub-resources
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', :on => :collection
#     end
#   end

# Sample resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
# root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
