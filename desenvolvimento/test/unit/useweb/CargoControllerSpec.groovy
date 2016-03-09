package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(CargoController)
@Mock(Cargo)
class CargoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.cargoInstanceList
            model.cargoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.cargoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def cargo = new Cargo()
            cargo.validate()
            controller.save(cargo)

        then:"The create view is rendered again with the correct model"
            model.cargoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            cargo = new Cargo(params)

            controller.save(cargo)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/cargo/show/1'
            controller.flash.message != null
            Cargo.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def cargo = new Cargo(params)
            controller.show(cargo)

        then:"A model is populated containing the domain instance"
            model.cargoInstance == cargo
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def cargo = new Cargo(params)
            controller.edit(cargo)

        then:"A model is populated containing the domain instance"
            model.cargoInstance == cargo
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/cargo/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def cargo = new Cargo()
            cargo.validate()
            controller.update(cargo)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.cargoInstance == cargo

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            cargo = new Cargo(params).save(flush: true)
            controller.update(cargo)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/cargo/show/$cargo.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/cargo/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def cargo = new Cargo(params).save(flush: true)

        then:"It exists"
            Cargo.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(cargo)

        then:"The instance is deleted"
            Cargo.count() == 0
            response.redirectedUrl == '/cargo/index'
            flash.message != null
    }
}
