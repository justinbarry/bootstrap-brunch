mv = require("mv")
fs = require('fs')

module.exports = class AfterBrunch
  brunchPlugin: yes

  constructor: (@config) ->

  onCompile: (generatedFiles)=>
    path = @config.paths.public
    files = fs.readdirSync(path)
    files.forEach (file)->
      if /\.(eot|svg|ttf|woff|woff2)$/.test(file)
        fs.rename("#{path}/#{file}", "#{path}/fonts/#{file}")
