class IceCreamController < ApplicationController

    get '/ice_creams/:id' do
        @ice_cream = IceCream.find(params[:id])
        erb :'ice_creams/show'
    end
end