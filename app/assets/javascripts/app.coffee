receta = angular.module('receta',[
  'templates',
  'ngRoute',
  'ngResource',
  'ngFlash',
  'controllers',
  'services'
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