{readService} = require './read-service'
UserModel = require './models/user-model'

userReadService = () ->
    service = {}

    service.getUser = (id) ->
        doc = readService.getDocument id
        return new UserModel doc

    return service

module.exports = userReadService()