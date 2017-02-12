receta = angular.module('receta',[
  'templates',
  'ui.router',
  'ngResource',
  'ngFlash',
  'controllers',
  'services'
])

receta.config([ '$stateProvider','$urlRouterProvider',
  ($stateProvider,$urlRouterProvider)->
    $stateProvider
      .state('recipes',{
      url: '/'
      templateUrl: "index.html"
      controller: 'RecipesCtrl'
    }).state('recipe', {
      url: '/recipes/:recipeId',
      templateUrl: "show.html",
      controller: 'RecipeCtrl'
    })
    $urlRouterProvider.otherwise('recipes');
])

controllers = angular.module('controllers',[])
services = angular.module('services',[])