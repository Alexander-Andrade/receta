receta = angular.module('receta',[
  'templates',
  'ui.router',
  'ngResource',
  'ngFlash',
  'ui-rangeSlider',
  'uiSwitch',
  'angularModalService',
  'mgo-angular-wizard',
  'rzModule',
  'controllers',
  'services',
  'directives'
])

receta.config([ '$stateProvider','$urlRouterProvider',
  ($stateProvider,$urlRouterProvider)->
    $stateProvider
      .state('recipes',{
      url: '/recipes?keywords'
      templateUrl: "recipes/index.html"
      controller: 'RecipesCtrl'
    }).state('recipes.recipe', {
      url: '/{recipeId:int}',
      templateUrl: "recipes/show.html",
      controller: 'RecipeCtrl'
    }).state('recipes.new', {
      url: '/new',
      templateUrl: "recipes/new.html",
      controller: 'RecipeCtrl'
    }).state('recipes.recipe.edit', {
      url: '/edit',
      templateUrl: "recipes/edit.html",
      controller: 'RecipeCtrl'
    })
    $urlRouterProvider.otherwise('recipes');
])

angular.module('controllers',[])
angular.module('services',[])
angular.module('directives',[])