angular.module('loomioApp').directive 'groupForm', ->
  scope: {group: '=', modal: '=?'}
  templateUrl: 'generated/components/group/form/group_form.html'
  controller: ($scope, PrivacyString) ->

    $scope.titleLabel = ->
      if $scope.group.isParent()
        "group_form.group_name"
      else
        "group_form.subgroup_name"

    $scope.privacyOptions = ->
      if $scope.group.isSubgroup() && $scope.group.parent().groupPrivacy == 'secret'
        ['closed', 'secret']
      else
        ['open', 'closed', 'secret']

    $scope.privacyStatement = ->
      PrivacyString.groupPrivacyStatement($scope.group)

    $scope.privacyStringFor = (privacy) ->
      PrivacyString.group($scope.group, privacy)
