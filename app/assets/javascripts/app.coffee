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

# lodash
receta.constant('_', window._)
  .run(($rootScope) ->
    $rootScope._ = window._
)

receta.config([ '$stateProvider','$urlRouterProvider',
  ($stateProvider,$urlRouterProvider)->
    $stateProvider
      .state('recipes',{
      url: '/recipes?keywords'
      templateUrl: "recipes/index.html"
      controller: 'RecipesCtrl'
      resolve:
        recipes : (Recipe) -> Recipe.query().$promise
    }).state('recipes.recipe', {
      url: '/{recipeId:int}',
      templateUrl: "recipes/show.html",
      controller: 'RecipesCtrl'
    }).state('recipes.new', {
      url: '/new',
      templateUrl: "recipes/new.html",
      controller: 'RecipesCtrl'
    }).state('recipes.recipe.edit', {
      url: '/edit',
      templateUrl: "recipes/edit.html",
      controller: 'RecipesCtrl'
    })
    $urlRouterProvider.otherwise('recipes');
])

angular.module('controllers',[])
angular.module('services',[])
angular.module('directives',[])