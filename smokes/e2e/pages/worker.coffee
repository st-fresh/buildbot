# this file will contains the different generic functions which
# will be called by the different tests
# inspired by this methodology
# http://www.lindstromhenrik.com/using-protractor-with-coffeescript/

builderPage = require('./builder.coffee')

class workerPage
    constructor: (builder) ->
        @builder = builder

    goWorker: () ->
        browser.get('#/workers')

    checkWorkerPage: () ->
        expect(browser.getCurrentUrl()).toContain('#/worker')

    checkHrefPresent: () ->
        hrefRef = element.all(By.css('a'))
        expect(hrefRef.getText()).toContain('slowruntests')
        expect(hrefRef.getText()).toContain('runtests')

    goBuilderLink: (builderName) ->
        builderLink = element.all(By.linkText(builderName))
        builderLink.click()
        return new builderPage(builderName, 'Force')

module.exports = workerPage
