ReturnValue = require 'nanocyte-component-return-value'
sameType = require 'same-type'

class GreaterThanHistorical extends ReturnValue
  onEnvelope: (envelope) =>
    { config, message, data } = envelope
    { left } = config
    right = data?.left

    return message unless right?

    [typedLeft, typedRight] = sameType [left, right]
    return message if typedLeft > typedRight

module.exports = GreaterThanHistorical
