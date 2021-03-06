Template.editMealLink.helpers({
  mealLinkClass: meal => mealExists(meal) ? 'exists' : ''
});

Template.editMealLink.events({
  'click a': function(event, template) {
    var mealName = template.data.meal;
    Meteor.call('mealFromName', mealName, function(error, result) {
      showEditMealModal(result);
    });
  }
});

function mealExists(name) {
  var meal = Meals.findOne({
    name: name
  });
  return meal != null
}