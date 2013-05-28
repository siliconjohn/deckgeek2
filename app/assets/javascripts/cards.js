window.App = window.App || {};

// Card model and view //////////////

App.Card=Backbone.Model.extend({
});

App.CardView=Backbone.View.extend({
  tag:"div",
  className:"card-view",
  template: JST['templates/cards/cardview'],
  events: {
    'click .delete-card-btn': 'delete',
    'click .edit-card-button' : 'editCard'
  },

  initialize:function(){
    _.bindAll(this,'render', 'remove', 'delete', 'editCard');
    this.listenTo(this.model,'change',this.render);
  },

  render:function(){
    this.$el.html(this.template(this.model.attributes));
  },

  remove:function(){
    this.model.destroy();
  },

  delete:function(){
    if(confirm("Are you sure you want to delete this card?"))
      this.model.destroy();
  },

  editCard: function(){
    window.location=window.App.data.deck_id +"/cards/" + this.model.id ;
  }
});

// Cards collection and view ////////

App.Cards=Backbone.Collection.extend({
  model:App.Card,
  url: function(){
    return window.App.data.deck_id + "/cards";
  }
});

App.CardsView=Backbone.View.extend({
  tag:"div",
  className:"cards-view",
  template: JST['templates/cards/cardsview'],
  events: {
    'click #add-card-btn' : 'newCard'
  },

  initialize:function(){
    _.bindAll(this,'addCard','render', 'newCard','setStyle');
    this.listenTo(this.collection,'add',this.addCard);
    this.listenTo(this.collection,'remove',this.render);
  },

  render: function(){
    this.$el.html(this.template());
    this.collection.each(this.addCard);
  },

  addCard: function(cardModel){
    var cardView=new App.CardView({model:cardModel});
    cardView.$el.appendTo(this.$('.cards-list'))
    cardView.render();
  },

  newCard: function(){
    var name=prompt("What do you want to name this card? (you can change it later)");
    if(name)
    {
      // give the new card the style of the last in collection
      lastCard=this.collection.last();

      if(lastCard)
        card=new App.Card({name:name,style_id:lastCard.get("style_id"), style:lastCard.get("style")});
      else
        card= new App.Card({name:name,style_id:1, style:{template_name:"style-1"}});

      this.collection.add(card);
      card.save();
    }
  },

  setStyle:function(style_id){
     this.collection.each(function(card){
      card.set('style_id',style_id);
      card.set('style',{template_name:"style-"+style_id});
      card.save();
    });
  }
});

function getCards(container,json){
  window.cards = new App.Cards();
  window.cardsView = new App.CardsView({collection: cards});
  window.cardsView.$el.appendTo(container);
  window.cards.reset(json);
  window.cardsView.render();
}
