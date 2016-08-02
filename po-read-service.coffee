{readService} = require './read-service'
PoModel = require './models/po-model'

poReadService = () ->
    service = {}

    service.getPo = (id) ->
        doc = readService.getDocument id
        return new PoModel doc

    return service

module.exports = poReadService()