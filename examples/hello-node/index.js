var catNames = require('cat-names')

module.exports = function example () {
  return `Hello ${catNames.random()}!`
}
