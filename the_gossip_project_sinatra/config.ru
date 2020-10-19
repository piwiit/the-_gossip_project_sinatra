require 'bundler'
Bundler.require

# Les lignes suivantes vont te permettre d'appeler facilement les autres fichiers de classe
$:.unshift File.expand_path('lib', __dir__)
require 'controller'
run ApplicationController
# section principale du programme
