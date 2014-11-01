describe 'Discussion/NewCommentItemController', ->
  $scope = null
  rootScope = null
  controller = null
  users = [
    { id: 1, name: 'BillWithers' },
    { id: 2, name: 'JamesWithers' },
    { id: 3, name: 'RobWithers' },
    { id: 4, name: 'MixWithers' }
  ]

  mockCommentService =
    like: (comment_id) ->
      true

    unlike: (comment_id) ->
      true

  beforeEach module 'loomioApp'

  beforeEach inject ($rootScope, $controller) ->
    rootScope = $rootScope
    $scope = $rootScope.$new()
    $scope.event =
      comment: ->
        id: 1
        body: 'hi there'
        createdAt: new Date()
        likerIds: []
        likers: -> []

    $scope.currentUser = {id: 1, name: 'Bill Withers'}

    controller = $controller 'NewCommentItemController',
      $scope: $scope
      CommentService: mockCommentService

  #describe 'likedBySentence', ->
    #describe 'when no one likes it', ->
      #it 'is empty', ->
        #expect($scope.likedBySentence).toEqual ''

    #describe 'when current user likes it', ->
      #beforeEach ->
        #$scope.currentUser = { id: 1, name: 'BillWithers' }
        #$scope.comment.likers = -> [{ id: 1, name: 'BillWithers' }]
        #$scope.comment.likerIds = _.map $scope.comment.likers(), (user) -> user.id
        #$scope.renderLikedBySentence()
        #$scope.$digest();

      #it 'returns "You like this"', ->
        #expect($scope.likedBySentence).toEqual 'You like this.'

    #describe 'when one user likes it', ->
      #beforeEach ->
        #$scope.currentUser = { id: 2, name: 'JamesWithers' }
        #$scope.comment.likers = -> [{ id: 1, name: 'BillWithers' }]
        #$scope.comment.likerIds = _.map $scope.comment.likers(), (user) -> user.id
        #controller.renderLikedBySentence()
        #rootScope.$digest();

      #it 'returns "BillWithers like this"', ->
        #expect($scope.likedBySentence).toEqual "BillWithers likes this."

    #describe 'when you and another person like it', ->
      #beforeEach ->
        #$scope.currentUser = { id: 1, name: 'BillWithers' }
        #$scope.comment.likers = -> [{ id: 1, name: 'BillWithers' },
                                    #{ id: 2, name: 'JamesWithers' }]
        #$scope.comment.likerIds = _.map $scope.comment.likers(), (user) -> user.id
        #controller.renderLikedBySentence()
        #rootScope.$digest();

      #it ' returns "You and JamesWithers like this."', ->
        #expect($scope.likedBySentence).toEqual "Liked by you and JamesWithers."

    #describe 'when you and 2 other people like it', ->
      #beforeEach ->
        #$scope.currentUser = { id: 1, name: 'BillWithers' }
        #$scope.comment.likers = -> [{ id: 1, name: 'BillWithers' },
                                    #{ id: 2, name: 'JamesWithers' },
                                    #{ id: 3, name: 'RobWithers' }]
        #$scope.comment.likerIds = _.map $scope.comment.likers(), (user) -> user.id
        #controller.renderLikedBySentence()
        #rootScope.$digest();

      #it ' returns "You, JamesWithers and RobWithers like this."', ->
        #expect($scope.likedBySentence).toEqual "Liked by you, JamesWithers and RobWithers."


  #   describe 'when one person likes it' ->

  # it 'knows its comment id', ->
  #   expect($scope.comment.id).toBeDefined()



  # describe 'like()', ->
  #   it 'likes a comment', ->
  #     spyOn(mockCommentService, 'like').andReturn(true)
  #     $scope.like()
  #     expect(mockCommentService.like).toHaveBeenCalledWith($scope.comment)

  # describe 'unlike()', ->
  #   it 'unlikes a comment', ->
  #     spyOn(mockCommentService, 'unlike').andReturn(true)
  #     $scope.unlike()
  #     expect(mockCommentService.unlike).toHaveBeenCalledWith($scope.comment)

  # describe 'currentUserLikesIt', ->
  #   describe 'and the current user does indeed like the comment', ->
  #     beforeEach ->
  #       $scope.comment.liker_ids_and_names = {1: 'Bill Withers'}

  #     it 'returns true', ->
  #       expect($scope.currentUserLikesIt()).toBe(true)

  #   describe 'and the current user does not like it', ->
  #     it 'returns false', ->
  #       expect($scope.currentUserLikesIt()).toBe(false)

  # describe 'anybodyLikesIt', ->
  #   context 'but nobody likes it', ->
  #     it 'is false', ->
  #       expect($scope.anybodyLikesIt()).toBe(false)

  #   context 'somebody likes it', ->
  #     beforeEach ->
  #       $scope.comment.liker_ids_and_names = {1: 'jim jam'}

  #     it 'is true', ->
  #       expect($scope.anybodyLikesIt()).toBe(true)

  # describe 'reply()', ->
  #   it 'emits the replyToCommentClicked signal', ->
  #     spyOn($scope, '$emit')
  #     $scope.reply()
  #     expect($scope.$emit).toHaveBeenCalledWith('replyToCommentClicked', $scope.comment)

  # describe 'isAReply()', ->
  #   context 'the comment has a parent', ->
  #     beforeEach ->
  #       $scope.comment.parent =
  #         id: 1
  #         author:
  #           name: 'Jim'
  #           id: 1
  #         body: 'i am a reply'

  #     it 'is true', ->
  #       expect($scope.isAReply()).toBe(true)

  #   context 'the comment does not have a parent', ->
  #     it 'is false', ->
  #       expect($scope.isAReply()).toBe(false)

