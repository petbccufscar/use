package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(EntrevistaInicialController)
@Mock(EntrevistaInicial)
class EntrevistaInicialControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.entrevistaInicialInstanceList
            model.entrevistaInicialInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.entrevistaInicialInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def entrevistaInicial = new EntrevistaInicial()
            entrevistaInicial.validate()
            controller.save(entrevistaInicial)

        then:"The create view is rendered again with the correct model"
            model.entrevistaInicialInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            entrevistaInicial = new EntrevistaInicial(params)

            controller.save(entrevistaInicial)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/entrevistaInicial/show/1'
            controller.flash.message != null
            EntrevistaInicial.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def entrevistaInicial = new EntrevistaInicial(params)
            controller.show(entrevistaInicial)

        then:"A model is populated containing the domain instance"
            model.entrevistaInicialInstance == entrevistaInicial
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def entrevistaInicial = new EntrevistaInicial(params)
            controller.edit(entrevistaInicial)

        then:"A model is populated containing the domain instance"
            model.entrevistaInicialInstance == entrevistaInicial
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/entrevistaInicial/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def entrevistaInicial = new EntrevistaInicial()
            entrevistaInicial.validate()
            controller.update(entrevistaInicial)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.entrevistaInicialInstance == entrevistaInicial

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            entrevistaInicial = new EntrevistaInicial(params).save(flush: true)
            controller.update(entrevistaInicial)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/entrevistaInicial/show/$entrevistaInicial.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/entrevistaInicial/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def entrevistaInicial = new EntrevistaInicial(params).save(flush: true)

        then:"It exists"
            EntrevistaInicial.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(entrevistaInicial)

        then:"The instance is deleted"
            EntrevistaInicial.count() == 0
            response.redirectedUrl == '/entrevistaInicial/index'
            flash.message != null
    }
}
