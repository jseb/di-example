bucket = require './db/bucket'

readService = () ->
    service = {}

    service.getDocument = (id) ->
        return bucket.get id

    return service

module.exports = readService()