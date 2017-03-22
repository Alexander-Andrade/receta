angular.module('controllers').
  controller("RecipesCtrl", [ '$scope', '$state','$stateParams','$resource','ModalService', 'Recipe','recipes','Flash',
    ($scope, $state,$stateParams,$resource,ModalService, Recipe,recipes, Flash)->

      if $state.current.name == 'recipes'
        $scope.recipes = recipes

#      if not $stateParams.recipeId
#        recipes.$promise.then(()->
#          console.log 'promisem is fired!!!'
#          console.log $scope.recipes
#          if $stateParams.keywords
#            keyword_list = _.split($stateParams.keywords, /[, ]+/)
#            $scope.recipes = _.filter(recipes, (recipe)->
#              _.every(keyword_list,(keyword)->
#                _.includes(_.lowerCase(recipe.name),_.lowerCase(keyword))
#              )
#            )
#        )

      if $state.current.name == 'recipes.recipe'
        $scope.recipe = _.find(recipes, (recipe)-> recipe.id == $stateParams.recipeId)
        if not $scope.recipe
          Flash.create('danger', "There is no recipe with ID #{$stateParams.recipeId}",0, true);
          $state.go('recipes')

      $scope.save = ->
        onError = (httpResponse)-> Flash.create('danger','Something went wrong')
        if $scope.recipe.id
          $scope.recipe.$save(
            ( ()-> $state.go("recipes.recipe", { recipeId: $scope.recipe.id }) ),
            onError)
        else
          Recipe.create($scope.recipe,
            ( (newRecipe) ->
              recipes.push(newRecipe)
              $state.go("recipes.recipe", { recipeId: newRecipe.id })),
            onError
          )

      $scope.delete = ->
        _.remove($scope.recipes, (recipe) -> recipe.id == $scope.recipe.id)
        $scope.recipe.$delete()
        $state.go("recipes")

#      $scope.showYesNo = ->
#        ModalService.showModal(
#          templateUrl: 'recipes/yesno.html'
#          controller: 'YesNoController').then (modal) ->
#            modal.element.modal()
#            modal.close.then (result) ->
#              $scope.yesNoResult = if result then 'You said Yes' else 'You said No'
#
#      $scope.priceSlider = {
#        value: 10
#        options: {
#          readOnly: true
#        }
#      }
#
#      setTimeout (->
#        $scope.$apply ->
#          $scope.priceSlider.value = 5
#      ), 2000

])

#angular.module('controllers')
#  .controller 'YesNoController', [
#    '$scope'
#    'close'
#    ($scope, close) ->
#
#      $scope.close = (result) ->
#        close result, 500
#        # close, but give 500ms for bootstrap to animate
#  ]
