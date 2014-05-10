class UsersController < ApplicationController
  expose(:users)
  before_filter :authenticate!

end
