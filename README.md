# Battleships_API

This is the Rails 5 component of Out of the Water, a Battleship clone written with a Rails 5 API and Ember.JS front-end.

Sink ships! Beat the indefatigable AI! Achieve world domination! Stop Sky-Net! And still make it home in time for milk and cookies.

## Prerequisites

You will need the following things installed on your computer:

* Ember.JS, bower, babel/babel-cli via `npm` (for the Ember component)
* Rails 5 installed via `gem`
* `bundler` gem installed

## Installation

* `git clone git@github.com:angyangie/battleships_api.git` this repository
* change into the new directory:
* `bundle install`

## Running / Development

* `rails s` to begin running the Rails server. You will also need the Ember component running; repo located at https://github.com/angyangie/Out_of_the_Water
* Once the Rails server is running, the JSON data being sent is viewable at http://localhost:3000. However, you'll need the Ember server running to play the game; run `ember s` and play on http://localhost:4200.
