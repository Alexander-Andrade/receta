controllers = angular.module('controllers')
controllers=angular.module('controllers')
controllers.controller("RecipeCtrl",['$scope','$routeParams','$location','$resource','Flash','Recipe'
  ($scope,$routeParams,$location,$resource, Flash,Recipe)->

    Recipe.get({recipeId: $routeParams.recipeId},
      ((recipe)-> $scope.recipe=recipe),
      ((httpResponce)->
        $scope.recipe = null
        Flash.create('danger', "There is no recipe with ID #{$routeParams.recipeId}",0, true);
#        flash.error = "There is no recipe with ID #{$routeParams.recipeId}"
      )
    )

    $scope.back = -> $location.path("/")
])