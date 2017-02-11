controllers = angular.module('controllers')
controllers=angular.module('controllers')
controllers.controller("RecipeCtrl",['$scope','$routeParams','$resource','flash',
  ($scope,$routeParams,$resource, flash)->
    Recipe = $resource('/recipes/:recipeId', {recipeId: "@id", format:'json'})
    Recipe.get({recipeId: $routeParams.recipeId},
      ((recipe)-> $scope.recipe=recipe),
      ((httpResponce)->
        $scope.recipe = null
        flash.error = "There is no recipe with ID #{$routeParams.recipeId}"
      )
    )

    $scope.back = -> $location.path("/")
])