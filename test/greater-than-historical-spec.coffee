ReturnValue = require 'nanocyte-component-return-value'
GreaterThanHistorical = require '..'

describe 'GreaterThanHistorical', ->
  beforeEach ->
    @sut = new GreaterThanHistorical

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an equal left than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 2}, data: {left: 2}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when called with a greaterer left than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 2}, data: {left: 1}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'

    describe 'when called with a greater left than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 2}, data: {left: 6}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when left and data are gregorically equal', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: '2012-01-01'}, data: {left: 'Jan 1, 2012'}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when left is gregorically greater than data', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: '2012-01-01'}, data: {left: 'Jan 2, 1777'}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'
