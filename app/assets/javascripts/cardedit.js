
App.CardEdit=Backbone.Model.extend({
  url:function(){
        return window.App.data.card_id;
      }
});

App.CardEditView=Backbone.View.extend({
  tag:"div",
  className:"card-edit",
  template: JST['templates/cards/cardedit'],

  initialize:function(){
    _.bindAll(this,'render','saveChanges','setImage');
    this.listenTo(this.model,'change',this.render);
  },

  render:function(){
    this.$el.html(this.template(this.model.attributes));
  },

  saveChanges:function(){
    this.model.set("name",$("#name-input").val());
    this.model.set("description",$("#description-input").val());
    this.model.save();
  },

  setImage:function(image_id){
    //show charly - resets vals
    this.model.set("image_id",image_id);
    this.model.set("name",$("#name-input").val());
    this.model.set("description",$("#description-input").val());

  }
});

function getCardEdit(container,json){
  window.cardEdit = new App.CardEdit();
  window.cardEditView = new App.CardEditView({model: cardEdit});
  window.cardEditView.$el.appendTo(container);
  window.cardEdit.set(json);
}