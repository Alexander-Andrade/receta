angular.module('controllers').
  controller("RecipeCtrl",['$scope','$state','$stateParams','$resource','Flash','Recipe'
    ($scope,$state,$stateParams,$resource, Flash,Recipe)->

      if $stateParams.recipeId
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
        onError = (httpResponse)-> Flash.create('danger','Something went wrong')
        if $scope.recipe.id
          $scope.recipe.$save(
            ( ()-> $state.go("recipes.recipe", { recipeId: $scope.recipe.id }) ),
            onError)
        else
          Recipe.create($scope.recipe,
            ( (newRecipe) -> $state.go("recipes.recipe", { recipeId: newRecipe.id })),
            onError
          )

      $scope.delete = ->
        $scope.recipe.$delete()
        $state.go("recipes")

  ])