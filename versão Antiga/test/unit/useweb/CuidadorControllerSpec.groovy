package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(CuidadorController)
@Mock(Cuidador)
class CuidadorControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.cuidadorInstanceList
            model.cuidadorInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.cuidadorInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def cuidador = new Cuidador()
            cuidador.validate()
            controller.save(cuidador)

        then:"The create view is rendered again with the correct model"
            model.cuidadorInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            cuidador = new Cuidador(params)

            controller.save(cuidador)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/cuidador/show/1'
            controller.flash.message != null
            Cuidador.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def cuidador = new Cuidador(params)
            controller.show(cuidador)

        then:"A model is populated containing the domain instance"
            model.cuidadorInstance == cuidador
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def cuidador = new Cuidador(params)
            controller.edit(cuidador)

        then:"A model is populated containing the domain instance"
            model.cuidadorInstance == cuidador
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/cuidador/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def cuidador = new Cuidador()
            cuidador.validate()
            controller.update(cuidador)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.cuidadorInstance == cuidador

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            cuidador = new Cuidador(params).save(flush: true)
            controller.update(cuidador)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/cuidador/show/$cuidador.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/cuidador/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def cuidador = new Cuidador(params).save(flush: true)

        then:"It exists"
            Cuidador.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(cuidador)

        then:"The instance is deleted"
            Cuidador.count() == 0
            response.redirectedUrl == '/cuidador/index'
            flash.message != null
    }
}
