InMemBucket = require '../db/in-mem-bucket'
{expect} = require 'chai'
rewire = require("rewire");

describe 'userAndPoReadService', ->
    userAndPoReadService = null
    bucket = null

    beforeEach ->
        bucket = new InMemBucket()

        readService = rewire '../read-service'
        poReadService = rewire '../po-read-service'
        userReadService = rewire '../user-read-service'
        userAndPoReadService = rewire '../user-and-po-read-service'

        readService.__set__ 'bucket', bucket
        poReadService.__set__ 'readService', readService
        userReadService.__set__ 'readService', readService
        userAndPoReadService.__set__ 'userReadService', userReadService
        userAndPoReadService.__set__ 'poReadService', poReadService

    it 'should return user and po', ->
        bucket.set 'userid', {name: 'foo', type: 'user'}
        bucket.set 'poid', {name: 'bar', type: 'po'}

        {user, po} = userAndPoReadService.getUserAndPo 'userid', 'poid'

        expect(user.name()).to.equal 'foo'
        expect(po.name()).to.equal 'bar'
