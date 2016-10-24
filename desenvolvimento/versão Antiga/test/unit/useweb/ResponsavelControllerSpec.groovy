package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(ResponsavelController)
@Mock(Responsavel)
class ResponsavelControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.responsavelInstanceList
            model.responsavelInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.responsavelInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def responsavel = new Responsavel()
            responsavel.validate()
            controller.save(responsavel)

        then:"The create view is rendered again with the correct model"
            model.responsavelInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            responsavel = new Responsavel(params)

            controller.save(responsavel)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/responsavel/show/1'
            controller.flash.message != null
            Responsavel.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def responsavel = new Responsavel(params)
            controller.show(responsavel)

        then:"A model is populated containing the domain instance"
            model.responsavelInstance == responsavel
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def responsavel = new Responsavel(params)
            controller.edit(responsavel)

        then:"A model is populated containing the domain instance"
            model.responsavelInstance == responsavel
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/responsavel/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def responsavel = new Responsavel()
            responsavel.validate()
            controller.update(responsavel)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.responsavelInstance == responsavel

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            responsavel = new Responsavel(params).save(flush: true)
            controller.update(responsavel)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/responsavel/show/$responsavel.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/responsavel/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def responsavel = new Responsavel(params).save(flush: true)

        then:"It exists"
            Responsavel.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(responsavel)

        then:"The instance is deleted"
            Responsavel.count() == 0
            response.redirectedUrl == '/responsavel/index'
            flash.message != null
    }
}
