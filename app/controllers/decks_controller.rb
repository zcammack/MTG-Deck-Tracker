class DecksController < ApplicationController
    require 'faraday'
    require 'json'

    $set = MTG::Set.all
    $type = MTG::Type.all
    $creaturetype = MTG::Subtype.all

    def index
        @decks = Deck.all
    end

    def new
        @deck = Deck.new
    end

    def create
        @user = current_user
        deck = Deck.new(deck_params)
        if deck.save
            redirect_to 
        else
            redirect_to 
        end
    end


end
