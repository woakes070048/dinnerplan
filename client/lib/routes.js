'use strict';

Router.configure({
  layoutTemplate: 'layout'
});

Router.route('/', function() {
  this.render('plan');
  this.layout('layout', {
    data: {active: 'plan'}
  })
});

Router.route('/recipes', function() {
  this.render('recipes');
  this.layout('layout', {
    data: {active: 'recipes'}
  })
});

Router.route('/about', function() {
  this.render('about');
  this.layout('layout', {
    data: {active: 'about'}
  })
});

Router.route('/categories', function() {
  this.render('categories');
  this.layout('layout', {
    data: {active: 'categories'}
  })
});

Router.route('/ingredients', function() {
  this.render('ingredients');
  this.layout('layout', {
    data: {active: 'ingredients'}
  })
});

Router.route('/shopping-list', function() {
  this.render('shoppingList');
  this.layout('layout', {
    data: {active: 'shopping-list'}
  })
});
