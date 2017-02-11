receta = angular.module('receta',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'services',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

receta.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
      templateUrl: "index.html"
      controller: 'RecipesCtrl'
    ).when('/recipes/:recipeId',
      templateUrl: "show.html",
      controller: 'RecipeCtrl'
    )
])

controllers = angular.module('controllers',[])
services = angular.module('services',[])