require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/attack.rb')
require_relative('../models/codeclanner.rb')
require_relative('../models/wizard.rb')
require_relative('../models/action.rb')
require_relative('../models/newaction.rb')

get '/attacks' do
  @attacks = Attack.all
  @actions = Action.all
  @newactions = Newaction.all
  erb ( :"attacks/index" )
end

get '/attacks/new' do
  @attacks = Attack.all
  @codeclanners = Codeclanner.all
  @wizards = Wizard.all
  erb (:"attacks/new")
end

post '/attacks' do
  attack = Attack.new(params)
  attack.save
  redirect to ("/attacks")
end


post '/attacks/:id/delete' do
    attack = Attack.find(params['id'])
    attack.delete()
    redirect to '/attacks'
end
