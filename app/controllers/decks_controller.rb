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
            redirect_to "/users/#{@user.id}/decks/#{deck.id}/edit/1"
        else
            redirect_to "/users/#{@user.id}/decks/new"
        end
    end

    def edit
        @deck = Deck.where()
    end

    def addCardToDeck
        @user = current_user
        card_id = params[:card_id]
        card = MTG::Card.where(id: card_id).all
        card = card[0]
        deck_id = params[:deck_id]
        number = params[:quantity].to_i
        @deck = Deck.find(deck_id)
    
        for i in 1..number
          @deck.cardlist += (card_id + ",")
          @deck.cardtypes += (card.type + ",")
          if card.image_url != nil
            @deck.imageurls += (card.image_url + ",")
          else
            @deck.imageurls += ("nil,")
          end
          @deck.cardnames += (card.name + "%")
        end
        @deck.save
    
        redirect_back(fallback_location: root_path)
      end
end
