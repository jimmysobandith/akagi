var config = require("../../shared/config");
var fetchModule = require("fetch");
var ObservableArray = require("data/observable-array").ObservableArray;
var http = require("http");

var evenement = [];

function GroceryListViewModel(items) {
    var viewModel = new ObservableArray(items);

    http.request({
        url: "http://teester.warmbee.com/page/json-evenements.php",
        method: "POST",
        headers: { "Content-Type": "application/json" }
        }).then(function(result) {
            console.log(JSON.stringify(result));
            var obj = result.content.toJSON();
            console.log("Je passe !");
            console.log(obj[0].nom);
            evenement = obj;
            viewModel.push(obj);

        }, function(error) {
            console.error(JSON.stringify(error));
    });

    viewModel.load = function() {
       viewModel.push(evenement);
    };
    
    viewModel.empty = function() {
        while (viewModel.length) {
            viewModel.pop();
        }
    };

    return viewModel;
}

function handleErrors(response) {
    if (!response.ok) {
        console.log(JSON.stringify(response));
        throw Error(response.statusText);
    }
    return response;
}

module.exports = GroceryListViewModel;