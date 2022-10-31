class StaticPagesController < ApplicationController
  def home
   @gossips = Gossip.all 
  end

  def welcome
  @gossips = Gossip.all
  end

  def team
  end

  def contact
  end
end
