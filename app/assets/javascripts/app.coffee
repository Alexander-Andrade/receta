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
      url: '/recipes?keywords'
      templateUrl: "index.html"
      controller: 'RecipesCtrl'
    }).state('recipes.recipe', {
      url: '/{recipeId:int}',
      templateUrl: "show.html",
      controller: 'RecipeCtrl'
    })
    $urlRouterProvider.otherwise('recipes');
])

controllers = angular.module('controllers',[])
services = angular.module('services',[])