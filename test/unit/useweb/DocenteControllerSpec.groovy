package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(DocenteController)
@Mock(Docente)
class DocenteControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.docenteInstanceList
            model.docenteInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.docenteInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def docente = new Docente()
            docente.validate()
            controller.save(docente)

        then:"The create view is rendered again with the correct model"
            model.docenteInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            docente = new Docente(params)

            controller.save(docente)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/docente/show/1'
            controller.flash.message != null
            Docente.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def docente = new Docente(params)
            controller.show(docente)

        then:"A model is populated containing the domain instance"
            model.docenteInstance == docente
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def docente = new Docente(params)
            controller.edit(docente)

        then:"A model is populated containing the domain instance"
            model.docenteInstance == docente
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/docente/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def docente = new Docente()
            docente.validate()
            controller.update(docente)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.docenteInstance == docente

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            docente = new Docente(params).save(flush: true)
            controller.update(docente)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/docente/show/$docente.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/docente/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def docente = new Docente(params).save(flush: true)

        then:"It exists"
            Docente.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(docente)

        then:"The instance is deleted"
            Docente.count() == 0
            response.redirectedUrl == '/docente/index'
            flash.message != null
    }
}
