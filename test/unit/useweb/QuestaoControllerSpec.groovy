package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(QuestaoController)
@Mock(Questao)
class QuestaoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.questaoInstanceList
            model.questaoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.questaoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def questao = new Questao()
            questao.validate()
            controller.save(questao)

        then:"The create view is rendered again with the correct model"
            model.questaoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            questao = new Questao(params)

            controller.save(questao)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/questao/show/1'
            controller.flash.message != null
            Questao.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def questao = new Questao(params)
            controller.show(questao)

        then:"A model is populated containing the domain instance"
            model.questaoInstance == questao
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def questao = new Questao(params)
            controller.edit(questao)

        then:"A model is populated containing the domain instance"
            model.questaoInstance == questao
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/questao/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def questao = new Questao()
            questao.validate()
            controller.update(questao)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.questaoInstance == questao

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            questao = new Questao(params).save(flush: true)
            controller.update(questao)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/questao/show/$questao.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/questao/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def questao = new Questao(params).save(flush: true)

        then:"It exists"
            Questao.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(questao)

        then:"The instance is deleted"
            Questao.count() == 0
            response.redirectedUrl == '/questao/index'
            flash.message != null
    }
}
