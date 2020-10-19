require 'gossip'
# lie le fichier gossip au controller
class ApplicationController < Sinatra::Base
  # envois l'utilisateur sur l'index uqand / en fin d'adresse
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end
  # envois l'utilisateur sur gossip/new  quand celui - ci est en fin d'adresse
  get '/gossips/new/' do
    erb :new_gossip
  end
  # envois à la method save  dans la class gossip avec les parametres indiqué
  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end
  # envois l'utilisateur sur la page show   quand celui - ci est en fin d'adresse

  get '/gossips/:id' do
    erb :show, locals: { gossip: Gossip.find(params['id']) }
  end
  # envois l'utilisateur sur la page edit quand celui - ci est en fin d'adresse

  get '/gossips/:id/edit/' do
    erb :edit, locals: { id: params['id'] }
  end
  # j'ai essayé mais pas reussi
  post '/gossips/:id/edit/' do
    Gossip.update(params['id'], params['gossip_author'], params['gossip_content'])
    redirect "/gossips/#{params['id']}/"
  end
end
