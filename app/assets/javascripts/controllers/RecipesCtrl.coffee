angular.module('controllers').
  controller("RecipesCtrl", [ '$scope', '$stateParams','$resource','ModalService','Recipe','$timeout'
    ($scope,$stateParams,$resource,ModalService, Recipe, $timeout)->

      if $stateParams.keywords
        Recipe.query(keywords: $stateParams.keywords, (results)->
          $scope.recipes=results
        )
      else
        $scope.recipes = []

      $scope.showYesNo = ->
        ModalService.showModal(
          templateUrl: 'recipes/yesno.html'
          controller: 'YesNoController').then (modal) ->
            modal.element.modal()
            modal.close.then (result) ->
              $scope.yesNoResult = if result then 'You said Yes' else 'You said No'

      $scope.priceSlider = {
        value: 10
        options: {
          readOnly: true
        }
      }

      setTimeout (->
        $scope.$apply ->
          $scope.priceSlider.value = 5
      ), 2000

])

angular.module('controllers')
  .controller 'YesNoController', [
    '$scope'
    'close'
    ($scope, close) ->

      $scope.close = (result) ->
        close result, 500
        # close, but give 500ms for bootstrap to animate
  ]
