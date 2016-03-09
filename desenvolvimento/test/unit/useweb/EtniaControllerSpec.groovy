package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(EtniaController)
@Mock(Etnia)
class EtniaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.etniaInstanceList
            model.etniaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.etniaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def etnia = new Etnia()
            etnia.validate()
            controller.save(etnia)

        then:"The create view is rendered again with the correct model"
            model.etniaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            etnia = new Etnia(params)

            controller.save(etnia)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/etnia/show/1'
            controller.flash.message != null
            Etnia.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def etnia = new Etnia(params)
            controller.show(etnia)

        then:"A model is populated containing the domain instance"
            model.etniaInstance == etnia
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def etnia = new Etnia(params)
            controller.edit(etnia)

        then:"A model is populated containing the domain instance"
            model.etniaInstance == etnia
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/etnia/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def etnia = new Etnia()
            etnia.validate()
            controller.update(etnia)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.etniaInstance == etnia

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            etnia = new Etnia(params).save(flush: true)
            controller.update(etnia)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/etnia/show/$etnia.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/etnia/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def etnia = new Etnia(params).save(flush: true)

        then:"It exists"
            Etnia.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(etnia)

        then:"The instance is deleted"
            Etnia.count() == 0
            response.redirectedUrl == '/etnia/index'
            flash.message != null
    }
}
