controllers = angular.module('controllers')
controllers.controller("RecipeCtrl",['$scope','$stateParams','$location','$resource','Flash','Recipe'
  ($scope,$stateParams,$location,$resource, Flash,Recipe)->

    if $routeParams.recipeId
      Recipe.get({recipeId: $stateParams.recipeId},
        ((recipe)-> $scope.recipe=recipe),
        ((httpResponce)->
          $scope.recipe = null
          Flash.create('danger', "There is no recipe with ID #{$stateParams.recipeId}",0, true);
        )
      )
    else
      $scope.recipe = {}

    $scope.save = ->
      onError = (_httpResponse)-> Flash.create('danger','Something went wrong')
      if $scope.recipe.id
        $scope.recipe.$save(
          ( ()-> )
        )
])