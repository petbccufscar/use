package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(CidadeController)
@Mock(Cidade)
class CidadeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.cidadeInstanceList
            model.cidadeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.cidadeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def cidade = new Cidade()
            cidade.validate()
            controller.save(cidade)

        then:"The create view is rendered again with the correct model"
            model.cidadeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            cidade = new Cidade(params)

            controller.save(cidade)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/cidade/show/1'
            controller.flash.message != null
            Cidade.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def cidade = new Cidade(params)
            controller.show(cidade)

        then:"A model is populated containing the domain instance"
            model.cidadeInstance == cidade
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def cidade = new Cidade(params)
            controller.edit(cidade)

        then:"A model is populated containing the domain instance"
            model.cidadeInstance == cidade
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/cidade/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def cidade = new Cidade()
            cidade.validate()
            controller.update(cidade)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.cidadeInstance == cidade

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            cidade = new Cidade(params).save(flush: true)
            controller.update(cidade)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/cidade/show/$cidade.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/cidade/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def cidade = new Cidade(params).save(flush: true)

        then:"It exists"
            Cidade.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(cidade)

        then:"The instance is deleted"
            Cidade.count() == 0
            response.redirectedUrl == '/cidade/index'
            flash.message != null
    }
}
