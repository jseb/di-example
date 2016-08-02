{poReadService} = require './po-read-service'
{userReadService} = require './user-read-service'

userAndPoReadService = () ->
    service = {}

    service.getUserAndPo = (userId, poId) ->
        user = userReadService.getUser userId
        po = poReadService.getPo poId

        return {user, po}

    return service

module.exports = userAndPoReadService()