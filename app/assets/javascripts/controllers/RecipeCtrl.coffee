controllers = angular.module('controllers')
controllers=angular.module('controllers')
controllers.controller("RecipeCtrl",['$scope','$stateParams','$location','$resource','Flash','Recipe'
  ($scope,$stateParams,$location,$resource, Flash,Recipe)->
    console.log 'goto recipe'
    Recipe.get({recipeId: $stateParams.recipeId},
      ((recipe)-> $scope.recipe=recipe),
      ((httpResponce)->
        $scope.recipe = null
        Flash.create('danger', "There is no recipe with ID #{$stateParams.recipeId}",0, true);
      )
    )
])